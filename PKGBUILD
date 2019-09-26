# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=cavapify
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="Script that will automatically change the color of the cava visualizer bars according to the color of the current album art of any media player that implements the MPRIS D-Bus Interface Specification."
arch=(any)
url="https://github.com/elmo-space/$_pkgname"
license=('GPL3')
makedepends=('git')
depends=('cava-git'
'imagemagick'
'playerctl'
'wget'
)
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/elmo-space/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
            install -Dm755 "$srcdir/$_pkgname/playcheck.sh" "$pkgdir/usr/bin/cavapify.sh"
}
