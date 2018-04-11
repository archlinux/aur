# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-gtk-theme
pkgver=2.0.0
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V2 Traditional GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523258884/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('d2e1a25ef88761ec82c6964c2dfc1165')

_dirname='Gnome-OSX-V2-Traditional--2-themes'
_themename='Gnome-OSX-V2-Traditional'

prepare() {
    mv "$_dirname/$_themename" "$_themename"
    mv "$_dirname/$_themename-NT" "$_themename-NT"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
