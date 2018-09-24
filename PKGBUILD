# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos11-icon-theme
pkgver=4.6
pkgrel=1
pkgdesc='macOS11 iCons Collection'
arch=('any')
url='https://www.opendesktop.org/p/1102582/'
license=('GPL')
depends=('gtk-update-icon-cache')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1533641153/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('69224980e432c65a8e50009033ed66e1')

prepare() {
    find -name '* *' -delete
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/icons/'{}' \;
}
