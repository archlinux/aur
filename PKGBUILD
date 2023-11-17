# Maintainer: Nathan Campolina <spectronp@proton.me>
pkgname=version
pkgver=1.4.1
pkgrel=1
pkgdesc="What version do I have of ___?"
arch=('any')
url="https://github.com/bit101/version"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bit101/version/archive/v$pkgver.tar.gz")
sha256sums=('a924ea88998bca6de18f4a8bb8bc26494e2d5e8f045ddbb1c4ed8385816014d3')

package() {
  cd "$pkgname-$pkgver"

  gzip -k ./man/version.1

  install -Dm755 version "${pkgdir}/usr/bin/version"
  install -Dm644 man/version.1.gz "${pkgdir}/usr/share/man/man1/version.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/version/LICENSE"
}
