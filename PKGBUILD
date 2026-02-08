pkgname=cmdflow
pkgver=0.1.6
pkgrel=1
pkgdesc="A colorful Fish command tracker with rainbow top visualization"
arch=('x86_64')
url="https://github.com/voideez/cmdflow"
license=('MIT')
depends=('bash')
makedepends=('rust' 'cargo')
source=("https://github.com/voideez/cmdflow/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver/cmdflow"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver/cmdflow"
  install -Dm755 target/release/cmdflow "$pkgdir/usr/bin/cmdflow"
}