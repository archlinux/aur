# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter
pkgver=1.0.10
pkgrel=4
pkgdesc='ranger-like file browser written in Rust'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
conflicts=(hunter-git hunter-holy hunter-holy-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('8e7f8050c8b26791c9e0039f6e59a4f3d80e9ccd2cce86fa8034692af29b24badc5d488eeb5af9da3c88032e4eee9bf0cf44618702bf43699306df141a4cfbeb')

build() {
  cd hunter-$pkgver
  cargo build --release
}

package() {
  cd hunter-$pkgver
  install -D {target/release/hunter,extra/scope.sh} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/hunter-holy
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
