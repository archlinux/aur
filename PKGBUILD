# Maintainer: bbaovanc <bbaovanc@bbaovanc.com

_pkgname=hentaifetch
_branch=master
pkgname=$_pkgname-git
pkgver=1.0
pkgrel=1
pkgdesc="neofetch but with hentai"
license=('GPL3')
arch=(any)
url="https://github.com/helpmeplsfortheloveofgod/hentaifetch"
depends=(curl jp2a neofetch imagemagick)
makedepends=(git make)
provides=($_pkgname)
conflicts=($_pkgname)

source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')

_makeopts="--directory=$_pkgname"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    PREFIX="$pkgdir/usr" make $_makeopts install
}
