# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osc-traditional-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSC Traditional GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('GPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523894983/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('d17ebfe9a3c6460f603649d1a7215a7a')

_dirname='Gnome-OSC-Traditional--2-themes'
_themename='Gnome-OSC-Traditional'

prepare() {
    mv "$_dirname/$_themename-(transparent)" "$_themename"
    mv "$_dirname/$_themename-(not transparent)" "$_themename-NT"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
