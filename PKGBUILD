pkgname=roplayer
pkgver=1.1.13
pkgrel=1
pkgdesc="RoPlayer - a desktop music player for Linux built with PyQt6"
arch=('any')
url="https://github.com/rohanisawesome/RoPlayer"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-mutagen' 'python-pychromecast' 'python-dbus' 'python-gobject')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rohanisawesome/RoPlayer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5d71b8815fd9faed212c8c21fb1add185baf0431268a4183e6fdf2d66822017')

package() {
    cd "$srcdir"/RoPlayer-*

    install -d "${pkgdir}/usr/share/roplayer"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"

    install -m644 icon.png "${pkgdir}/usr/share/pixmaps/roplayer.png"

    cp player.py "${pkgdir}/usr/share/roplayer/"
    install -m755 roplayer "${pkgdir}/usr/bin/roplayer"

    install -m644 roplayer.desktop "${pkgdir}/usr/share/applications/roplayer.desktop"
}
