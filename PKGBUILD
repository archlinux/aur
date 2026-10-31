# Maintainer: toxdes <hi@toxdes.com>
pkgname=mousr
pkgver=0.1.9
pkgrel=1
pkgdesc="Keyboard-driven mouse control for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/mousr"
license=('MIT')
depends=('wayland' 'libxkbcommon')
makedepends=('git' 'rust' 'pkgconf')
source=("git+https://github.com/toxdes/mousr.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/mousr"
  cargo build --release --locked
}

package() {
  cd "$srcdir/mousr"
  install -Dm755 target/release/mousr "$pkgdir/usr/bin/mousr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
