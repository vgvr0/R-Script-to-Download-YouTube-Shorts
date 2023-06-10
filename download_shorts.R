library(tuber)

download_shorts <- function(url) {
  tryCatch({
    video <- YouTubeVideo(url)
    available_formats <- video$get_stream_types()
    if ("video/mp4" %in% available_formats) {
      video$download(format = "video/mp4")
      message("Descarga completa.")
    } else {
      message("No se encontró ningún vídeo compatible.")
    }
  }, error = function(e) {
    message("Se produjo un error durante la descarga:", conditionMessage(e))
  })
}

# URL del YouTube Shorts que deseas descargar
shorts_url <- "https://www.youtube.com/shorts/XXXXXXXXXXX"

# Llama a la función de descarga
download_shorts(shorts_url)
