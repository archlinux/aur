# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osc-shell-theme
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSC Shell Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('GPL')
depends=('gnome-shell-extensions')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523894911/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('e27a5732f183649c5b883d0f7bf932d3')

_dirname='Gnome-OSC-Shell-themes'
_themename='Gnome-OSC'

prepare() {
    mv "$_dirname/$_themename-Dark-Shell" "$_themename-Dark-Shell"
    mv "$_dirname/$_themename-Light-Shell" "$_themename-Light-Shell"
    mv "$_dirname/$_themename-shell-Space-Grey" "$_themename-Space-Grey-Shell"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
