

pkgname=uutils-sed
pkgver=0.3.0
pkgrel=1
pkgdesc="Rust implementation of sed"
arch=('x86_64')
url=https://github.com/uutils/sed
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('c5cf64ca6874d93e65e1197fe50c8c9650c52b6104621fb72436f208f4ece52e73fc58593d0e995cdf6ef1e745594144564df5ed1768a0abd5ccaf66044685eb')

build(){
  cd sed-$pkgver
  cargo build --release
}

package() {
  cd sed-$pkgver
  install -Dm755 target/release/sed "$pkgdir"/usr/bin/uu-sed
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
