pkgname=pijul
pkgver=0.8.0
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64')
license=('GPL')
source=("${url}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c1fa9c56f8371544fc95283c27b8e92d37ce4454a28f49c40d68366ecc82738c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
