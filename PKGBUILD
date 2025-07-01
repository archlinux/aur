# Maintainer: ethanrutt <ethan.rutt2032@gmail.com>
pkgname=chadtop
pkgver=0.1.0
pkgrel=1
pkgdesc="tui process and resource monitor"
arch=('any')
url="https://github.com/ethanrutt/chadtop/"
license=("GPL")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethanrutt/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
options=(!lto)
sha256sums=('ff0eb2f82b6ac3c6c6299a162c575e0ab116ff51d7f7230f78475ea3242e47eb')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

