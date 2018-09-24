# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mcos-mjv-gtk-theme
pkgver=1.2
pkgrel=2
pkgdesc='McOS-MJV GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1241688/'
license=('GPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1529367928/s/$_s/t/$_t/u//$pkgname-$pkgver.tar.xz")
md5sums=('f945ed9144d63782006b1dfbe9acc1fd')

prepare() {
    rm McOS-MJV/COPYING
    rm McOS-MJV/READ\ ME
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
