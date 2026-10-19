# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=wireforge
pkgver=0.9.0
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/wireforge-v$pkgver.tar.gz")
sha256sums=('12dab5e2121fb7f6a4b8ba36121bf2ed21ab9f42cf2d84ee92494b004c250097')

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
