# Maintainer: Matthias Fulz <mfulz at olznet dot de>
pkgname=archbuilder
pkgver=0.9.3
pkgrel=2
pkgdesc='makepkg wrapper that uses buildah'
url='https://github.com/mfulz/archbuilder'
arch=('any')
source=(
        "https://github.com/mfulz/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
       )
sha256sums=('dc4bc4bb2863f07925cf23444a78714030b37cc984e364b33bf2918c609b0e79')
depends=('buildah')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
