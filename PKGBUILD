# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-shell-theme
pkgver=1.3.2
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V Shell Themes'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gnome-shell-extensions')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1513095820/s/$_s/t/$_t/Gnome-OSX-Shell-themes-V.tar.xz")
md5sums=('35c18ba062fe7dad1f9666ce264f541c')

_name='Gnome-OSX-Shell-themes-V'

package() {
    cd "$_name"
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
