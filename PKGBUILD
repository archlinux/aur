# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tenderly-cli-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Smart contract error tracking, monitoring and alerting"
arch=('x86_64' 'aarch64')
url="https://github.com/Tenderly/tenderly-cli"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tenderly_${pkgver}_Linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tenderly_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('7d9b3bb96d0bd69cca4bb4478965655140ee0e5a7de1df3a4da743dee418902e')
sha256sums_aarch64=('99fe6008ae5b48b033b2efd7aa31bd267c1751200afcc384c11410189f1240bb')

package() {
  install -Dm755 "tenderly" "${pkgdir}/usr/bin/tenderly"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
