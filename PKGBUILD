# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>
# Contributor : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=kalker
pkgver=1.1.0
pkgrel=1
pkgdesc="A calculator program that supports user-defined variables, functions, derivation, and integration."
url="https://github.com/PaddiM8/kalker"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PaddiM8/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('955c504e58a62d4f46d82bdb91b675a22e247be57caf5364b86824d63cfed264877a3b563a3456771f15765b3a808dc1f149283c539901b89030f629cf7421c8')
