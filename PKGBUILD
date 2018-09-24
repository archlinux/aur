# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mcos-mjv-dark-mode-gtk-theme
pkgver=1.2
pkgrel=2
pkgdesc='McOS-MJV-Dark-mode GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1241688/'
license=('GPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1529367916/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('10fde4ece0c846b980c53e9731ed2fbc')

prepare() {
    rm McOS-MJV-Dark-mode/COPYING
    rm McOS-MJV-Dark-mode/READ\ ME
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
