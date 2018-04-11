# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-light-gtk-theme
pkgver=2.0.0
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V2 Traditional Light GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523258900/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('276e3c65a87f6e2d57d2dbf7e3212767')

_dirname='Gnome-OSX-V2-traditional-light-menus--2-themes'
_themename='Gnome-OSX-V2-Traditional'

prepare() {
    mv "$_dirname/$_themename-light-menu" "$_themename-Light"
    mv "$_dirname/$_themename-NT-light-menu" "$_themename-Light-NT"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
