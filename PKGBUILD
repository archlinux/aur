# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-evil
pkgver=1.0.3
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (evil branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
provides=(hunter)
conflicts=(hunter hunter-git hunter-evil-git)
source=($url/archive/v$pkgver-evil.tar.gz)
sha512sums=('e673b0680cf48712e9cfae7d8f767f124e83760b512ab257e20954346ef571c3c860bc5a7dde8bc6086c122e8f6c58d4409dc3057db4786a123bf5928f4389be')

build() {
  cd hunter-$pkgver-evil
  cargo build --release
}

package() {
  cd hunter-$pkgver-evil
  install -D target/release/hunter -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
