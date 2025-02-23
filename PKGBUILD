# Maintainer: Adriik <adriik[dot]linux[at]proton[dot]me>

pkgname=jackandbet
pkgver=0.1.0
pkgrel=2
pkgdesc="Just a simple blackjack game for the terminal."
arch=('x86_64')
url="https://codeberg.org/Adriik/jackandbet"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz") 
sha256sums=('1680db0ac4a85136cb5a6bad214820d97b03641b2d424b1467dfd9f5417f8d7b')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install INSTALL_DIR="$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
