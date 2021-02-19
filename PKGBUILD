# Maintainer: lmartinez-mirror <lmartinez-mirror at noreply dot github dot com>
pkgname=baru
pkgver=0.2.3
pkgrel=1
pkgdesc='A system monitor written in Rust and C'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
makedepends=('git' 'rust')
optdepends=(
  'libnl: for wired and wireless modules'
  'libpulse: for sound and mic modules'
)
conflicts=('baru-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4812c649e98a000e134e0b149bf394b0f198845bce2036356ffb0c66921fd7220a53f866f95101212d5862ab53e2cc5e9702738f475acaea778dfd2afc00f5f2')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm 755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

