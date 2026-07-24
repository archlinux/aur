pkgname=vectomancy
pkgver=7.0.0
pkgrel=1
pkgdesc="Image-to-Equation Converter CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/vectomancy"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/vectomancy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87db7bfa8f5a55b8ee407519f04247e27c0df2d3ba5b1861c4ec05d8f10a4026')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/vectomancy" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
