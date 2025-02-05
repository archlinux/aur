pkgname=hashrat
pkgver=1.23
pkgrel=1
pkgdesc="Hashing tool. Includes recursive file hashing and other features."
arch=('any')
url="https://github.com/ColumPaget/Hashrat"
license=('GPL')
depends=()
source=("https://github.com/ColumPaget/Hashrat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5767cbd574e6214a6d133ca9678acadf9e64b2d37a5c77a23f632ede53567c21')

build() {
    cd "$srcdir/Hashrat-$pkgver"
    ./configure --enable-xattr --prefix "$pkgdir/usr"
    make
}

package() {
    mkdir -p "$pkgdir/usr"
    cd "$srcdir/Hashrat-$pkgver"
    make install
}
