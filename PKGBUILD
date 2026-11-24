# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ota-bin
pkgver=1.6.28
pkgrel=1
pkgdesc="Execution governance for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/ota-run/ota"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ota-run/ota/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ota-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ota-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('e3c151ac1be0424e8bd314d2852b7b9ac0913195fa340680f4ebd44f1a8d2cff')
sha256sums_x86_64=('f7546e64e392a007eb265bf19cbce59421259ff36d652ccd7dd30c13846f0aa0')
sha256sums_aarch64=('69f14b1572800446c481aea38d8c0c35c1aa37eb44f5a6ad0187672990321d37')

package() {
  install -Dm755 "ota" "${pkgdir}/usr/bin/ota"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
