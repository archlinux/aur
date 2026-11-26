pkgname=roplayer
pkgver=1.1.12
pkgrel=1
pkgdesc="RoPlayer - a desktop music player for Linux built with PyQt6"
arch=('any')
url="https://github.com/rohanisawesome/RoPlayer"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-mutagen' 'python-pychromecast' 'python-dbus' 'python-gobject')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rohanisawesome/RoPlayer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab2c1ed9fc1702cf36a9b1a2faa1b3f91994fe2e0c6cb83d780c6ee4f7ae9b61')

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
