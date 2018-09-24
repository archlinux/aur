# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos-icon-theme
pkgver=4.6
pkgrel=1
pkgdesc='macOS iCons Collection'
arch=('any')
url='https://www.opendesktop.org/p/1102582/'
license=('GPL')
depends=('gtk-update-icon-cache')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1533641078/s/$_s/t/$_t/u//$pkgname-$pkgver.tar.xz")
md5sums=('ca465c201306cdaee71e6f2d6588afe8')

prepare() {
    find -name '* *' -delete
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/icons/'{}' \;
}
