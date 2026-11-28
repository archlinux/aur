# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dopbase-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight self-hosted secrets manager in a single file"
arch=('x86_64' 'aarch64')
url="https://github.com/dopbase/dopbase"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dopbase_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dopbase_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4251da90852185c3a2ff914c63a68ec241cb469367750d38655f7956bf3c7f72')
sha256sums_aarch64=('334696066dea1d49813900a9ded3589c6c76049ab3f56df8eff8fecd86a66777')

package() {
  install -Dm755 "dopbase" "${pkgdir}/usr/bin/dopbase"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
