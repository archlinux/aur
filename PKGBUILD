# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-hsierra-light-gtk-theme
pkgver=1.3.6
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V HighSierra Light GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1518825489/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('1e81c88e4a78715cd763cb0677a790c6')

_dirname='Gnome-OSX-V-HSierra-light-menu-->2-themes'
_themename='Gnome-OSX-V-HSierra'
_ver='1-3-5'

prepare() {
    mv "$_dirname/$_themename-$_ver-light-menu" "$_themename-Light"
    mv "$_dirname/$_themename-NT-$_ver-light-menu" "$_themename-Light-NT"
    rmdir "$_dirname"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
