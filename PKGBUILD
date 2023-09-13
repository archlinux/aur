# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.4.2
pkgrel=1
pkgdesc="An mpc-like CLI tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('cdd4a435e65d59870d3a7845e741c4f4248d5a3c8e951b6316a545c9f3e2b167')

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
