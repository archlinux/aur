# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osc-hs-light-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSC HS Light GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('GPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523895028/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('2db23e899cbec2138237d976bc1946a8')

_dirname='Gnome-OSC-HS-light-menu-- 2-themes'
_themename='Gnome-OSC-HS'

prepare() {
    mv "$_dirname/$_themename-(transparent)-light-menu" "$_themename-Light"
    mv "$_dirname/$_themename-(not-transparent)-light-menu" "$_themename-Light-NT"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
