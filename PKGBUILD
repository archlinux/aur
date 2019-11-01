# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=bb-rs
pkgver=0.3.1
_commit=d9228f3c4328b9323cab7fecb96346f5181072a0
pkgrel=1
pkgdesc='Simple process viewer in Rust'
arch=(x86_64)
url=https://nessuent.xyz/bb.html
license=(GPL3)
depends=(gcc-libs)
makedepends=(rust)
source=($pkgname-$pkgver.tar.gz::https://github.com/epilys/bb/archive/$_commit.tar.gz)
sha512sums=('8a01964cf50818ad78d898bb80fb1866c32d2dcb53fed624da777836e915360e9bafa36b285a9e55ce9826aaa6fc33504048720d4ae477f3510ee14e1f0dc845')

build() {
  cd bb-$_commit
  cargo build --release
}

check() {
  cd bb-$_commit
  cargo test --release
}

package() {
  cd bb-$_commit
  install -D target/release/bb -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/bb
}
