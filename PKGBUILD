pkgname=hashrat
pkgver=1.22
pkgrel=1
pkgdesc="Hashing tool. Includes recursive file hashing and other features."
arch=('any')
url="https://github.com/ColumPaget/Hashrat"
license=('GPL')
depends=()
source=("https://github.com/ColumPaget/Hashrat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2fbda06422faf195bf57c232270131f527ae3d8b0aad88ec3a2d1e89f1f82d8b')

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
