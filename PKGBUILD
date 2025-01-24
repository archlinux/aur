pkgname=buddhasay
pkgver=0.7.3
pkgrel=1
pkgdesc="Like Cowsay, but with a Buddha."
url="https://codeberg.org/siebenBC/buddhasay"
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}::git+https://codeberg.org/siebenBC/buddhasay.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd $srcdir/buddhasay-$pkgver
  install -Dm755 target/release/buddhasay "$pkgdir/usr/bin/buddhasay"
  install -d "$pkgdir/usr/share/buddhasay"
  install -Dm755 resources/buddhasay.toml "$pkgdir/usr/share/buddhasay/buddhasay.toml"
}
