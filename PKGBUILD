pkgname=vectomancy
pkgver=4.0.2
pkgrel=1
pkgdesc="Image-to-Equation Converter CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/vectomancy"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/vectomancy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5c39f754967d5865e567c40b14796844ca0133f6fcd2ced94068bda2c4c0ed3')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/vectomancy" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
