# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-space-grey-gtk-theme
pkgver=1.3.6
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V Space Grey GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1518825410/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('1ed12bf34a04f2691ba50e8fe8ac43c0')

_dirname='Gnome-OSX-SpaceGrey-->2-themes'
_themename='Gnome-OSX-V-Space-Grey'

prepare() {
    mv "$_dirname/$_themename-${pkgver//./-}" "$_themename"
    mv "$_dirname/$_themename-NT-${pkgver//./-}" "$_themename-NT"
    rmdir $_dirname
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
