# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter
pkgver=1.1.0
pkgrel=1
pkgdesc='ranger-like file browser written in Rust'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
conflicts=(hunter-git hunter-holy hunter-holy-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('133424f43424d096a440b4323edca6a658829e2ff6e16ce848110cf7caf0d87ea890b91f0029e36f3aac60574579624ecc7597e4584565d67ed990c78877fb4d')

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
