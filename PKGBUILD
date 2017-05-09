# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='macos-icon-theme'
pkgver=3.6
pkgrel=1
pkgdesc='macOS iCons Theme'
arch=('any')
url='https://www.gnome-look.org/p/1102582/'
depends=('gtk-update-icon-cache')
source=('https://dl.opendesktop.org/api/files/download/id/1494077696/macOS.tar.xz')
md5sums=('5f7f20692c732b7189a4c9935d5d8388')

prepare() {
    cd "$srcdir"
    find -name '* *' -delete
}

package() {
    cd "$srcdir"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/{}" \;
}
