# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pewpew-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Flexible HTTP stress tester"
arch=('x86_64' 'aarch64')
url="https://github.com/bengadbois/pewpew"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pewpew_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pewpew_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('826c1458586c143c6b653edd6750ada1caabe623a5fc60af94cf858feefe7d64')
sha256sums_aarch64=('87671caecfd7540d47ede30783c80f06c8535449828ab8a02c1597517f4a64fc')

package() {
  install -Dm755 "pewpew" "${pkgdir}/usr/bin/pewpew"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
