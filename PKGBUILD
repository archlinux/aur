# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos11-gtk-theme
pkgver=2.1
pkgrel=1
pkgdesc='macOS11 GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1220826/'
license=('GPL')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1535246761/s/$_s/t/$_t/$pkgname-$pkgver.zip")
md5sums=('1061de359ad39d731455fe29864da0c3')

prepare() {
    mv macOS11-GTK macOS11
    rm macOS11/COPYING
    rm macOS11/index.theme
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
