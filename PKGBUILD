# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=wireforge
pkgver=0.6.0
pkgrel=1
pkgdesc="Braille Wireframe Viewer"
arch=(
  'x86_64'
  'aarch64'
  'riscv64'
)
url="https://github.com/Vaishnav-Sabari-Girish/wireforge"
license=('MIT')

depends=('gcc-libs')
makedepends=(
  'cargo'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eb247e7d721d53757cbd2c6f9c62593209d171481f47750835a3c2ca8cd371a5')

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
