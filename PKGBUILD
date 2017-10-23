# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='macos-icon-theme'
pkgver=4.1
pkgrel=3
pkgdesc='macOS Icon Theme'
arch=('any')
url='https://www.gnome-look.org/p/1102582/'
depends=('gtk-update-icon-cache')
source=('https://dl.opendesktop.org/api/files/download/id/1507938583/macOS.tar.xz')
md5sums=('f8ae00459837db8db380b744e72f875f')

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
