pkgname=raquette-baballe
pkgver=1.0.1
pkgrel=1
options=(!debug strip)
pkgdesc="A homemade arkanoid game in C++"
arch=('x86_64')
url="https://github.com/LuxySs-Evr5/RaquetteBaballe"
license=('GPL3')
makedepends=('gcc' 'make')
source=('https://github.com/LuxySs-Evr5/RaquetteBaballe/releases/download/v1.0.1/raquette-baballe-1.0.1.pkg.tar.zst')
sha256sums=('59cfbcf92b21a40a6d6fbfc0eb1985038eff0900cd1b41daf1e13027711d761e')

build() {
  make
}

package() {
  install -Dm755 "raquette-baballe" "$pkgdir/usr/bin/raquette-baballe"

  install -Dm644 "ressources/raquette-baballe.desktop" "$pkgdir/usr/share/applications/raquette-baballe.desktop"
  install -Dm644 "ressources/icon/logo.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/raquette-baballe.png"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -r "ressources" "$pkgdir/usr/share/$pkgname/"
}
