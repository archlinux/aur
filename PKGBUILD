# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.2.7
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('9ee8e96b2a61555a8e4502787a5e3ff62d9f81a68b181fff83e162e6f79dca83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mpvc" "$pkgdir/usr/bin/mpvc"
}
