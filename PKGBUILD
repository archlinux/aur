# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-shell-theme
pkgver=2.0.0
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V2 Shell Themes'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gnome-shell-extensions')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523258803/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('466e6bfe1eb4cc9f495801851027e507')

_dirname='Gnome-OSX-Shell-themes-V2/Gnome-OSX-Shell-themes-V-2'
_themename='Gnome-OSX-V2'

prepare() {
    mv "$_dirname/$_themename-Dark-Shell" "$_themename-Dark-Shell"
    mv "$_dirname/$_themename-Light-Shell" "$_themename-Light-Shell"
    mv "$_dirname/$_themename-shell-Space-Grey" "$_themename-Space-Grey-Shell"
}

package() {
    cd "$_name"
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
