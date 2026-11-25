# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=metabigor-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="OSINT tool that needs no API keys"
arch=('x86_64' 'aarch64')
url="https://github.com/j3ssie/metabigor"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/metabigor_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/metabigor_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('60e4098a58bf0d1f37886ebc5951e660b31860a98c1da69596af3c4c60ab54bb')
sha256sums_aarch64=('3912144bd1d00a089468784012dddff99ea1d9ab5e991039b4edbfb78923db64')

package() {
  install -Dm755 "metabigor" "${pkgdir}/usr/bin/metabigor"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
