# Maintainer: svturnring <svturnring@icloud.com>
pkgname=wpoverlay
pkgver=1.0
pkgrel=1
pkgdesc="Configurable Wayland wallpaper overlay with theme support using GTK4"
arch=('any')
url="https://github.com/svturnring/wpoverlay"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'gtk4-layer-shell')

source=("$pkgname-$pkgver.tar.gz::https://github.com/svturnring/wpoverlay/archive/refs/tags/v$pkgver.tar.gz")

package() {
    cd "${startdir}"

    # Install the main script
    install -Dm755 "src/wpoverlay.sh" "${pkgdir}/usr/bin/wpoverlay"

    # Install the Python daemon
    install -Dm755 "src/wpoverlay-daemon.py" "${pkgdir}/usr/share/wpoverlay/wpoverlay-daemon.py"

    # Install documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/wpoverlay/README.md"
}
sha256sums=('974f08bd2a15e241a18473de44520f746dab555cf970a269d87de234f20c2d61')
