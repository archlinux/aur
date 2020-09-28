# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=zola
pkgver=0.12.2
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/getzola/zola"
depends=('gcc-libs')
makedepends=('rust')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getzola/zola/archive/v${pkgver}.tar.gz")
sha256sums=('1c0cb37e9a3d9f7ff41012996eb068fb5453c9727f107ac817429cbdae4dae84')

build() {
  cd zola-$pkgver
  cargo build --release --locked
}

check() {
  cd zola-$pkgver
  cargo test --release --locked
}

package() {
  cd zola-$pkgver
  install -Dm755 target/release/zola "$pkgdir"/usr/bin/zola
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
