# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openase-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Ticket-driven automated software engineering"
arch=('x86_64' 'aarch64')
url="https://github.com/PacificStudio/openase"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openase_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openase_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('57db5cc4a02169cb30589b08234129242fd126b9c3c27152f59440f6a7323ee2')
sha256sums_aarch64=('1e745e988c65188e3bbe0e4466b85f37cf174912338b52be5094efec7c58ca63')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="openase_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="openase_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/openase" "${pkgdir}/usr/bin/openase"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
