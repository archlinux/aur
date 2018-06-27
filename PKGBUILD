# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos11-icon-theme
pkgver=4.5.1
pkgrel=1
pkgdesc='macOS11 iCons Collection'
arch=('any')
url='https://www.opendesktop.org/p/1102582/'
license=('GPL')
depends=('gtk-update-icon-cache')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1529627496/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('c4e9b1ed1ce6a363b9c3a66b09e63fa7')

prepare() {
    find -name '* *' -delete
    cp macOS11/apps/128/accessories_calculator.png macOS11/apps/128/gnome-calculator.png
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/icons/'{}' \;
}
