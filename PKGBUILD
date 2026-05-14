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
sha256sums=('4d0616891dfa9042a41216dd6a7c2fbc403b4b3d597e90bb5b21e04154bab255')

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
