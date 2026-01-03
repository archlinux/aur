# Maintainer: Nathan Campolina <spectronp@proton.me>
pkgname=version
pkgver=1.5.2
pkgrel=2
pkgdesc="What version do I have of ___?"
arch=('any')
url="https://codeberg.org/bit101/version"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/bit101/version/archive/v$pkgver.tar.gz")
sha256sums=('5047c17f28a0477af378d09084a8077ca981830feb1badd9cdfbae0c0ff2662f')

package() {
  cd "$pkgname"

  gzip -k ./man/version.1

  install -Dm755 version "${pkgdir}/usr/bin/version"
  install -Dm644 man/version.1.gz "${pkgdir}/usr/share/man/man1/version.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/version/LICENSE"
}
