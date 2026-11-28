# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=templier-bin
pkgver=0.13.6
pkgrel=1
pkgdesc="Templ development environment with automatic rebuild and reload"
arch=('x86_64' 'aarch64')
url="https://github.com/romshark/templier"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/templier_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/templier_Linux_arm64.tar.gz")
sha256sums_x86_64=('e36bed95e76aac1a42d8d2d195ade063d2a154b87b212d5c28680e82fe9f15ab')
sha256sums_aarch64=('478ec91d09996251feceddf54f6629c8049e4fc82fde3df4822216750149a262')

package() {
  install -Dm755 "templier" "${pkgdir}/usr/bin/templier"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
