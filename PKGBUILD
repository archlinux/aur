# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=pacom
pkgver=1.0.4
pkgrel=1
pkgdesc="Pacom: the Pacman companion"
url="https://github.com/kriansa/pacom"
arch=(any)
license=(Apache)
depends=(jq curl)
source=("https://github.com/kriansa/pacom/archive/v${pkgver}.tar.gz")
sha256sums=(86ee5988d493fc666435ab669785c1a0dcb045f2e0f3bc8fd5153447db917d3d)

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
