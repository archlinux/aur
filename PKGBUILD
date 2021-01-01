# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=pacom
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacom: the Pacman companion"
url="https://github.com/kriansa/pacom"
arch=(any)
license=(apache)
depends=(jq curl)
source=("https://github.com/kriansa/pacom/archive/v${pkgver}.tar.gz")
sha256sums=(b8e7fc92479fdeecf542ff7430d47be9f5973ee223d83c94c2d6fa4a4bc1aace)

build() {
  cd "$pkgname-$pkgver" || exit 1
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r build/pacom "$pkgdir"
}
