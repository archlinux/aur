# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ccrider-bin
pkgver=1.19.3
pkgrel=1
pkgdesc="Search, browse and resume Claude Code sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/neilberkman/ccrider"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/neilberkman/ccrider/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ccrider_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ccrider_${pkgver}_linux_arm64.tar.gz")
sha256sums=('8723ca4104cab48f19e73ca06f2b9a452921d75459215b66b15d1e765b0fcd00')
sha256sums_x86_64=('37450ec2ebb1fe28d637807fe106500e1e847d9f693611b6c0c7e918b6f14755')
sha256sums_aarch64=('9414b72beec92dae3d7e9872bd332d6c49b96469500c628d00b6c716285fa70f')

package() {
  install -Dm755 "ccrider" "${pkgdir}/usr/bin/ccrider"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
