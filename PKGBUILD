# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>
# Contributor : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=kalker
pkgver=1.0.0
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
b2sums=('e62b4c6959fce045e4209fc5c4d73ccacd38a0a3ae6236b927081bf8d5540fcd4443b48ab677215bee771d2b6b4368ecdaf6f42f40abb37eb62cb429a70c5449')
