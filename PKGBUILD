# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-gtk-theme
pkgver=1.3.5
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V Traditional GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

_name='Gnome-OSX-V-Traditional'

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1517759784/s/$_s/t/$_t/$_name-${pkgver//./-}.tar.xz")
md5sums=('7a5dc7831187f40477b97e96fa0df118')

prepare() {
    mv "$_name-${pkgver//./-}" "$_name"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
