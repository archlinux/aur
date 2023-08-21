# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.4.0
pkgrel=1
pkgdesc="An mpc-like CLI tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('f91d97776426ddfbe388f44dea1ece301639010d1f842e0120980403a4e08ce6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build -r --bins --examples
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/mpvc "$pkgdir/usr/bin/mpvc"
  install -Dm755 target/release/examples/mpvc-polybar "$pkgdir/usr/bin/mpvc-polybar"
  install -Dm755 examples/mpvc-fzf "$pkgdir/usr/bin/mpvc-fzf"
}
