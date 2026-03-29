pkgname=audium
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal music app built in Rust"
arch=('x86_64')
url="https://github.com/takashialpha/audium"
license=('Apache')
depends=('alsa-lib')
makedepends=('cargo' 'alsa-lib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/takashialpha/audium/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/audium \
    "$pkgdir/usr/bin/audium"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
