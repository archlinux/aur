# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-evil
pkgver=1.0.1
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (evil branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
conflicts=(hunter hunter-git hunter-evil-git)
source=($url/archive/v$pkgver-evil.tar.gz)
sha512sums=('d296f880abe4c6eed1df886e47654ff4a23d04eae450056041ead67c366b4efc09e9c01178e9aaffb6df02461b975057c1516eede4131991f39a0b506796ef55')

build() {
  cd hunter-$pkgver-evil
  cargo build --release
}

package() {
  cd hunter-$pkgver-evil
  install -D target/release/hunter -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
