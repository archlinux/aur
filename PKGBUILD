# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mcos-mjv-gtk-theme
pkgver=1.3
pkgrel=1
pkgdesc='McOS-MJV GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1241688/'
license=('GPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1537831784/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('1aed15c46dd14ef1aac31d16f7b8a048')

prepare() {
    mv McOS-MJV-Gnome-3.30 McOS-MJV
    rm McOS-MJV/COPYING
    rm McOS-MJV/READ\ ME
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
