# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mcos-mjv-dark-mode-gtk-theme
pkgver=1.3
pkgrel=1
pkgdesc='McOS-MJV-Dark-mode GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1241688/'
license=('GPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1537831751/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('1870353a897ebb1a8f13061959e0dee6')

prepare() {
    mv McOS-MJV-Dark-mode-Gnome-3.30 McOS-MJV-Dark-mode
    rm McOS-MJV-Dark-mode/COPYING
    rm McOS-MJV-Dark-mode/READ\ ME
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
