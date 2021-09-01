# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=cavapify
pkgname=$_pkgname-git
pkgver=r15.a2d3160
pkgrel=5
pkgdesc="Automatically change the color of the cava visualizer bars according to the color of the current album art of any media player that implements the MPRIS."
arch=(any)
url="https://github.com/kb-elmo/$_pkgname"
license=('GPL3')
makedepends=('git')
depends=('cava-git'
'imagemagick'
'playerctl'
'wget'
)
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/kb-elmo/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
            install -Dm755 "$srcdir/$_pkgname/playcheck.sh" "$pkgdir/usr/bin/playcheck.sh"
}
