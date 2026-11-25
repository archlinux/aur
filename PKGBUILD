# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=misconfig-mapper-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="Find security misconfigurations in third-party services"
arch=('x86_64' 'aarch64')
url="https://github.com/intigriti/misconfig-mapper"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/misconfig-mapper_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/misconfig-mapper_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('da93948e3607e3a014553efba6c91268be6b9fdc06aad18ee2c90e9e104aaa4a')
sha256sums_aarch64=('6e06b5703a070712ae701731f5bbb0764a58a2ea2b43e90ab19c825b626abc28')

package() {
  install -Dm755 "misconfig-mapper" "${pkgdir}/usr/bin/misconfig-mapper"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
