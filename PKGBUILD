# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osc-traditional-light-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSC Traditional Light GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('GPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523895002/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('bdb046db168f4cb0882bd9ca77fc5a5a')

_dirname='Gnome-OSC--traditional-light-menus---2-themes'
_themename='Gnome-OSC-Traditional'

prepare() {
    mv "$_dirname/$_themename-light-menu-(transparent)" "$_themename-Light"
    mv "$_dirname/$_themename-light-menu-(not-transparent)" "$_themename-Light-NT"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
