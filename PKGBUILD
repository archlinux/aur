pkgname=raquette-baballe
pkgver=1.0.0
pkgrel=1
pkgdesc="A homemade arkanoid"
arch=('x86_64')
url="https://github.com/LuxySs-Evr5/RaquetteBaballe"
license=('GPL3')
depends=('allegro')
makedepends=('gcc' 'make' 'cmake')
source=("https://github.com/LuxySs-Evr5/RaquetteBaballe/releases/download/v1.0.0/raquette-baballe.tar.gz")
sha256sums=('b968e4b7cbbc8d2daabc3e5d8752c1aea9bcd54a83985f40473f5e2f5620f491')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/raquette-baballe" "$pkgdir/usr/bin/raquette-baballe"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/ressources" "$pkgdir/usr/share/$pkgname/"
}
