# Maintainer: Nathan Campolina <spectronp@proton.me>
pkgname=version
pkgver=1.5.2
pkgrel=1
pkgdesc="What version do I have of ___?"
arch=('any')
url="https://github.com/bit101/version"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bit101/version/archive/v$pkgver.tar.gz")
sha256sums=('1e1413d482ee8cb6cd0c0b44ee4545c64590cc0921717a5184de399190050848')

package() {
  cd "$pkgname-$pkgver"

  gzip -k ./man/version.1

  install -Dm755 version "${pkgdir}/usr/bin/version"
  install -Dm644 man/version.1.gz "${pkgdir}/usr/share/man/man1/version.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/version/LICENSE"
}
