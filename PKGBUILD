pkgname=raquette-baballe
pkgver=1.0.0
pkgrel=1
options=(!debug strip)
pkgdesc="A homemade arkanoid game in C++"
arch=('x86_64')
url="https://github.com/LuxySs-Evr5/RaquetteBaballe"
license=('GPL3')
depends=('allegro')
makedepends=('gcc' 'make' 'cmake')
source=("https://github.com/LuxySs-Evr5/RaquetteBaballe/releases/download/v1.0.0/raquette-baballe.tar.gz")
sha256sums=('c0b2f9b921b2b4d9b56294b8864d9f40f68aaf19ebb8663a342f2d2d5012bee5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/raquette-baballe" "$pkgdir/usr/bin/raquette-baballe"

  install -Dm644 "$srcdir/$pkgname-$pkgver/ressources/raquette-baballe.desktop" "$pkgdir/usr/share/applications/raquette-baballe.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/raquette-baballe.png"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/ressources" "$pkgdir/usr/share/$pkgname/"
}
