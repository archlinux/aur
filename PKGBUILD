# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-light-gtk-theme
pkgver=1.3.5
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V Traditional Light GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

_name='Gnome-OSX-V-Traditional'

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1517759767/s/$_s/t/$_t/$_name-${pkgver//./-}-light-menus.tar.xz")
md5sums=('6c987c3d2cfa112098a1fad9a78dda99')

prepare() {
    mv "$_name-${pkgver//./-}-light-menus" "$_name-light-menus"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
