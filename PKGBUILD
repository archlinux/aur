# Maintainer: RgeditV1 <angelmiguelparedes@gmail.com>
pkgname=yt-dlp-gui
pkgver=1.0.1
pkgrel=10
pkgdesc="A GUI for yt-dlp written in Python with customtkinter"
arch=("x86_64")
url="https://github.com/RgeditV1/yt-dlp-linux-gui"
license=('MIT')
depends=('python' 'python-customtkinter' 'python-pillow' 'python-plyer' 'yt-dlp')
makedepends=('git')
source=("https://github.com/RgeditV1/yt-dlp-linux-gui/releases/download/stable-${pkgver}/ytdlp_linux_gui.zip"
        "yt-dlp-gui.desktop")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "${srcdir}"

  # Instalar el ejecutable YTDLP en /usr/bin
  install -Dm755 ytdlp_linux_gui/YTDLP "${pkgdir}/usr/bin/YTDLP"

  # Instalar el .desktop en aplicaciones
  install -Dm644 yt-dlp-gui.desktop \
    "${pkgdir}/usr/share/applications/yt-dlp-gui.desktop"

  # Instalar el icono
  install -Dm644 ytdlp_linux_gui/img/icon.jpg \
    "${pkgdir}/usr/share/pixmaps/yt-dlp-gui.jpg"
}
