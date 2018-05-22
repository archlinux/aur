pkgname=pijul
pkgver=0.10.0
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64')
license=('GPL')
source=("${url}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('da3fcba4ab39a4371cda7273691364c2355c9b216bb7867d92dae5812ebb71d2')

build() {
  cd $srcdir/"$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd $srcdir/"$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
