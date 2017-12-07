# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='macos-icon-theme'
pkgver=4.1.5
pkgrel=2
pkgdesc='macOS Icons Theme'
arch=('any')
url='https://www.opendesktop.org/p/1102582/'
depends=('gtk-update-icon-cache')
source=('https://dl.opendesktop.org/api/files/download/id/1510321229/macOS.tar.xz')
md5sums=('056982040d0efdcf4fa93b0e5bc9bc3d')

prepare() {
    cd "$srcdir"
    find -name '* *' -delete
    cp macOS/status/symbolic/*.svg macOS/devices/symbolic
    mv macOS/apps/128/accessories_calculator.png macOS/apps/128/accessories-calculator.png
}

package() {
    cd "$srcdir"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/{}" \;
}
