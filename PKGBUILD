# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-hsierra-light-gtk-theme
pkgver=2.0.0
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V2 HighSierra Light GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523258853/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('d9f4add8747ae58d24d1b7ddc3bf668c')

_dirname='Gnome-OSX-V2-HSierra-light-menu--2-themes'
_themename='Gnome-OSX-V2-HSierra'

prepare() {
    mv "$_dirname/$_themename--light-menu" "$_themename-Light"
    mv "$_dirname/$_themename-NT-light-menu" "$_themename-Light-NT"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
