# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=pacom
pkgver=2.1.0
pkgrel=1
pkgdesc="Pacom: the Pacman companion"
url="https://github.com/kriansa/pacom"
arch=(any)
license=(Apache)
depends=(jq curl)
source=("https://github.com/kriansa/pacom/archive/v${pkgver}.tar.gz")
sha256sums=(a9c5e207b7ea7bc5889bb7dbe23d3c6d2b7c2816ca3cdac27360d816a1c83abf)

build() {
  cd "$pkgname-$pkgver" || exit 1
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d -m755 "$pkgdir/usr/bin/"
  cp build/pacom "$pkgdir/usr/bin/"
}
