# Maintainer: Nathan Campolina <spectronp@proton.me>
pkgname=version
pkgver=1.5.0
pkgrel=1
pkgdesc="What version do I have of ___?"
arch=('any')
url="https://github.com/bit101/version"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bit101/version/archive/v$pkgver.tar.gz")
sha256sums=('6a2ab4bdae92c3f90c32a88ffd7c61e027894d07bf8c229e7194150dc47e5447')

package() {
  cd "$pkgname-$pkgver"

  gzip -k ./man/version.1

  install -Dm755 version "${pkgdir}/usr/bin/version"
  install -Dm644 man/version.1.gz "${pkgdir}/usr/share/man/man1/version.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/version/LICENSE"
}
