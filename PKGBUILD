# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-hsierra-light-gtk-theme
pkgver=1.3.5
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

_name='Gnome-OSX-V-HSierra'

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1517759806/s/$_s/t/$_t/$_name-${pkgver//./-}-light-menus.tar.xz")
md5sums=('3988ddba65dd105201f6b031578250d6')

prepare() {
    mv "$_name-${pkgver//./-}-light-menus" "$_name-light-menus"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
