# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter
pkgver=1.0.1
pkgrel=1
pkgdesc='ranger-like file browser written in Rust'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
conflicts=(hunter-git hunter-evil hunter-evil-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('6793286b988820fadd43099f3d78db53169250ae17b67f0af2379c055a2508e60bab54befa0cb263090da68c10188db2c99d9cd47a7d1d4074bc0479aa5d2818')

build() {
  cd hunter-$pkgver
  cargo build --release
}

package() {
  cd hunter-$pkgver
  install -D target/release/hunter -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
