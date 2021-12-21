# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=pacom
pkgver=2.1.2
pkgrel=1
pkgdesc="Pacom: the Pacman companion"
url="https://github.com/kriansa/pacom"
arch=(any)
license=(Apache)
depends=(jq curl)
source=("https://github.com/kriansa/pacom/archive/v${pkgver}.tar.gz")
sha256sums=(ae06746b1096383d7be7c6d6749fc92478478e6ffcf8b36b231c45434ef358cb)

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
