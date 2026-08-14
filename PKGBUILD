pkgname=vectomancy
pkgver=8.0.0
pkgrel=1
pkgdesc="Image-to-Equation Converter CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/vectomancy"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/vectomancy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecd558aeab97d55d4faa0409a1e44e757af59e5a804b582a5fc1d32c4935564d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/vectomancy" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
