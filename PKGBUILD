# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter
pkgver=1.0.3
pkgrel=1
pkgdesc='ranger-like file browser written in Rust'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
conflicts=(hunter-git hunter-evil hunter-evil-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('66f8059643994058c539bc1ff93e8bc194238554c767436d40aa730f01398d7b81d9f7f24e6e91b82133742285224f3b3c9a4b62b059ad57a85b36049d35d0b2')

build() {
  cd hunter-$pkgver
  cargo build --release
}

package() {
  cd hunter-$pkgver
  install -D target/release/hunter -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
