# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=mustream
pkgname=$_pkgname-git
pkgver=r55.2f0cb52
pkgrel=4
pkgdesc=" A script to play music (with spotify) through the command line. "
arch=(any)
url="https://github.com/belkadev/$_pkgname"
license=('GPL3')
makedepends=('git')
depends=(
    'spotify'
    'bash'
)
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/belkadev/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
            install -Dm755 "$srcdir/$_pkgname/play" "$pkgdir/usr/bin/play"
}
