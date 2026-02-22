# Maintainer: RgeditV1 <angelmiguelparedes@gmail.com>
pkgname=yt-dlp-gui
pkgver=1.0
pkgrel=1
pkgdesc="A GUI for yt-dlp written in Python with customtkinter"
arch=("x86_64")
url="https://github.com/RgeditV1/yt-dlp-linux-gui"
license=('MIT')
depends=('python' 'python-customtkinter' 'python-pillow' 'python-plyer' 'yt-dlp')
makedepends=('git' 'cx_freeze')
source=("git+https://github.com/RgeditV1/yt-dlp-linux-gui.git""yt-dlp-gui.desktop")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/yt-dlp-linux-gui"
  python setup.py build
}

package() {
  cd "${srcdir}/yt-dlp-linux-gui"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 "${srcdir}/yt-dlp-gui.desktop" \
    "${pkgdir}/usr/share/applications/yt-dlp-gui.desktop"

  install -Dm644 ytdlp_gui/img/icon.jpg \
    "${pkgdir}/usr/share/pixmaps/yt-dlp-gui.jpg"
}
