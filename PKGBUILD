# Maintainer: <mrcjkb89@outlook.com>
pkgname=idris2-lsp-git
pkgver=0.5.1
pkgrel=2
pkgdesc="[WIP] Idris 2 language server"
arch=('any')
url="https://github.com/idris-community/idris2-lsp"
license=('BSD-3')
depends=('idris2')
makedepends=('git')
provides=("idris2-lsp")
conflicts=('idris2-lsp')
source=('git+https://github.com/idris-community/idris2-lsp.git')
md5sums=('SKIP')

_srcname="idris2-lsp"

build() {
    cd "$srcdir/$_srcname"
    git checkout idris2-$pkgver
    make build
}

package() {
    cd "$srcdir/$_srcname"
    PREFIX="$pkgdir/usr" make install-only # Install idris2-lsp
}
