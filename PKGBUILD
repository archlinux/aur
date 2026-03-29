pkgname=audium
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal music app built in Rust"
arch=('x86_64')
url="https://takashialpha.github.io/audium"
license=('Apache')
depends=('alsa-lib')
makedepends=('cargo' 'alsa-lib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/takashialpha/audium/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('71382b5301e1b72671ab219bff2aae4fad6296d364a0cc747051cf70b30fd1d8')

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
