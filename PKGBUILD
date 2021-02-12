# Maintainer: bbaovanc <bbaovanc@bbaovanc.com>

_pkgname=ye
_branch=master
pkgname=$_pkgname-git
pkgver=r4.f112cb4
pkgrel=1
pkgdesc="yes, but without a newline"
license=('GPL3')
arch=(any)
url="https://github.com/BBaoVanC/$_pkgname"
makedepends=(git make)
provides=($_pkgname)
conflicts=($_pkgname)

source=("git+https://github.com/BBaoVanC/$_pkgname.git#branch=${_branch}")
sha256sums=('SKIP')

_makeopts="--directory=$_pkgname"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    PREFIX="$pkgdir/usr" make $_makeopts install
}
