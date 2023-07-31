# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.2.5
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('c7e5a6f24db64a79f012523b095c7b9ba6cc9bfb2d3b2096ff2097cb76cf63d7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mpvc" "$pkgdir/usr/bin/mpvc"
}
