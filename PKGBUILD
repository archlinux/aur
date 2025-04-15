# Maintainer: Adriik <adriik[dot]linux[at]proton[dot]me>

pkgname=jackandbet
pkgver=0.2.0
pkgrel=1
pkgdesc="Just a simple blackjack game for the terminal."
arch=('x86_64')
url="https://codeberg.org/Adriik/jackandbet"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz") 
sha256sums=('86412aa9cfa10a1c3786999564a8abd4427987845aa64b3a3472c2a299111b3c')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install INSTALL_DIR="$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
