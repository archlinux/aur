# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-space-grey-gtk-theme'
pkgver=1.3.1
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

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1512508473/s/$_s/t/$_t/Gnome-OSX-V-Space-Grey-${pkgver//./-}.tar.xz")
md5sums=('156f5036482dbc45c939fe47e34d05ed')

_name='Gnome-OSX-V-Space-Grey'

prepare() {
    mv "$_name-${pkgver//./-}" "$_name"
}

package() {
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
