# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=wireforge
pkgver=0.8.0
pkgrel=1
pkgdesc="Braille Wireframe Viewer"
arch=(
  'x86_64'
  'aarch64'
  'riscv64'
)
url="https://github.com/lenitain/wireforge"
license=('MIT')

depends=('gcc-libs')
makedepends=(
  'cargo'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b422f8e695891226a6eab7a79b9028f80406850f0139a12b8e872af62d167216')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 \
    target/release/$pkgname \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
