# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zbxtable-bin
pkgver=3.0.8
pkgrel=1
pkgdesc="Reporting system for Zabbix"
arch=('x86_64' 'aarch64')
url="https://github.com/canghai908/zbxtable"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zbxtable-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zbxtable-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('d8f5dd2d8ea587c5e9d394572e573a8086ba2714912aec8d18230034bfbaefc6')
sha256sums_aarch64=('f8eb9294334877da988f6b5a7d0df0c2ef432829dbab1d8c2566b46090a419c0')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="zbxtable-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="zbxtable-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/zbxtable" "${pkgdir}/usr/bin/zbxtable"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
