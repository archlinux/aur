# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.2.6
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('233bc654e1138a576515a032ee06bebf25ef021ba9dee5cf80d12f943b014210')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mpvc" "$pkgdir/usr/bin/mpvc"
}
