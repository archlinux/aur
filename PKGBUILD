pkgname=vectomancy
pkgver=6.0.1
pkgrel=1
pkgdesc="Image-to-Equation Converter CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/vectomancy"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/vectomancy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('293c7de684e243983d0f52da531efd090e1fa91fb74dccb274baa1cc499a4643')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/vectomancy" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
