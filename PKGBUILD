# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos11-gtk-theme
pkgver=2.2
pkgrel=2
pkgdesc='macOS11 GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1220826/'
license=('GPL')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p" | head -n2))

source=("https://dl.opendesktop.org/api/files/download/id/1538912802/s/$_s/t/$_t/$pkgname-$pkgver.zip")
md5sums=('702bf77b4f056d6ece7cfc0062c61bf5')

prepare() {
    mv macOS11-GTK macOS11
    rm macOS11/COPYING
    rm macOS11/index.theme
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
