pkgname=hashrat
pkgver=1.15
pkgrel=1
pkgdesc="Hashing tool. Includes recursive file hashing and other features."
arch=('any')
url="https://github.com/ColumPaget/Hashrat"
license=('GPL')
depends=()
source=("https://github.com/ColumPaget/Hashrat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('833366b29da6ec8048d4f295bb3938588b5d098dcdabd96c18df9d3b8ad3ef44')

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
