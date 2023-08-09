# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.2.8
pkgrel=2
pkgdesc="An mpc-like CLI tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('2e551fc30d50ac81627c17e4092f5237f15ed7142051fc1d11cb7f02db99a28a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build -r --bins --examples
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/mpvc "$pkgdir/usr/bin/mpvc"
  install -Dm744 target/release/examples/mpvc-polybar "$pkgdir/usr/bin/mpvc-polybar"
  install -Dm755 examples/mpvc-fzf "$pkgdir/usr/bin/mpvc-fzf"
}
