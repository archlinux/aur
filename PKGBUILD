pkgname=pijul
pkgver=0.12.0
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo')
depends=('gcc-libs' 'libsodium' 'clang')
arch=('i686' 'x86_64')
license=('GPL')
source=("${url}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('987820fa2a6fe92a9f516f5e9b41ad59a597973e72cb0c7a44ca0f38e741a7e6')

build() {
  cd $srcdir/"$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd $srcdir/"$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
