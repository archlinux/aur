# Maintainer: bbaovanc <bbaovanc@bbaovanc.com

_pkgname=nekofetch
_branch=master
pkgname=$_pkgname-git
pkgver=r30.0e8a74b
pkgrel=1
pkgdesc="neofetch but with nekos"
license=('GPL3')
arch=(any)
url="https://github.com/propruhh/nekofetch"
depends=(curl jq jp2a neofetch)
makedepends=(git make)
provides=($_pkgname)
conflicts=($_pkgname)

source=("git+https://github.com/propruhh/$_pkgname.git#branch=${_branch}")
sha256sums=('SKIP')

_makeopts="--directory=$_pkgname"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    PREFIX="$pkgdir/usr" make $_makeopts install
}
