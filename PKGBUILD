# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=pacom
pkgver=2.0.0
pkgrel=1
pkgdesc="Pacom: the Pacman companion"
url="https://github.com/kriansa/pacom"
arch=(any)
license=(Apache)
depends=(jq curl)
source=("https://github.com/kriansa/pacom/archive/v${pkgver}.tar.gz")
sha256sums=(1f7a90c010707034b457ceaab526cfe117f1247d8acb301bd64e85d402b6a0fc)

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
