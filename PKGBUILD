# Maintainer: bbaovanc <bbaovanc@bbaovanc.com

_pkgname=nekofetch
pkgname=$_pkgname-git
pkgver=r27.56ee91f
pkgrel=1
pkgdesc="neofetch but with nekos"
arch=(any)
url="https://github.com/propruhh/nekofetch"
depends=(curl jq jp2a neofetch)
makedepends=(git make)
provides=($_pkgname)

source=("git+https://github.com/propruhh/$_pkgname.git")
sha256sums=('SKIP')

_makeopts="--directory=$_pkgname"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    PREFIX="$pkgdir/usr" make $_makeopts install
}
