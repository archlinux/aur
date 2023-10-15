# Maintainer: Nathan Campolina <spectronp@proton.me>
pkgname=version
pkgver=1.3.0
pkgrel=1
pkgdesc="What version do I have of ___?"
arch=('any')
url="https://github.com/bit101/version"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bit101/version/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88d22bead04f4826fb08ffc609b5a92721058e7466e202a36081be2ae7bb9d6c')

package() {
  cd "$pkgname-$pkgver"

  gzip -k ./man/version.1

  install -Dm755 version "${pkgdir}/usr/bin/version"
  install -Dm644 man/version.1.gz "${pkgdir}/usr/share/man/man1/version.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/version/LICENSE"
}
