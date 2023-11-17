# Maintainer: Nathan Campolina <spectronp@proton.me>
pkgname=version
pkgver=1.4.0
pkgrel=1
pkgdesc="What version do I have of ___?"
arch=('any')
url="https://github.com/bit101/version"
license=('MIT')
depends=('bash')
sha256sums=('c3f9935aa2f1f4febddaa2e3fcbb639819e2591233a59d8ce805cc3f550f00ed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bit101/version/archive/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"

  gzip -k ./man/version.1

  install -Dm755 version "${pkgdir}/usr/bin/version"
  install -Dm644 man/version.1.gz "${pkgdir}/usr/share/man/man1/version.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/version/LICENSE"
}
