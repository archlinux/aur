# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='macos-icon-theme'
pkgver=3.8
pkgrel=3
pkgdesc='macOS iCons Theme'
arch=('any')
url='https://www.gnome-look.org/p/1102582/'
depends=('gtk-update-icon-cache')
source=('https://dl.opendesktop.org/api/files/download/id/1494895082/macOS.tar.xz')
md5sums=('26ee193b24012bd1b10504e82379181d')

prepare() {
    cd "$srcdir"
    find -name '* *' -delete
    cp macOS/status/symbolic/*.svg macOS/devices/symbolic
}

package() {
    cd "$srcdir"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/{}" \;
}
