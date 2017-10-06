# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='macos-icon-theme'
pkgver=4.0
pkgrel=1
pkgdesc='macOS iCons Theme'
arch=('any')
url='https://www.gnome-look.org/p/1102582/'
depends=('gtk-update-icon-cache')
source=('https://dl.opendesktop.org/api/files/download/id/1507048263/macOS.tar.xz')
md5sums=('7452d7fd02ad9c9f05121c346b1fbf72')

prepare() {
    cd "$srcdir"
    find -name '* *' -delete
    cp macOS/status/symbolic/*.svg macOS/devices/symbolic
}

package() {
    cd "$srcdir"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/{}" \;
}
