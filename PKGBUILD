# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentrq-bin
pkgver=0.19.11
pkgrel=1
pkgdesc="Human-in-the-loop realtime task manager for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/agentrq/agentrq"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agentrq_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agentrq_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b3b968db38c6dc3361a70ba68ae867c683b58f9cbe21ffa116a84e82c8feb8b6')
sha256sums_aarch64=('d450e20e9fda3f3ea3439d92d16d3b7f9b757ad006a4e7aba9a6af9f2c108a48')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="agentrq_${pkgver}_linux_amd64" ;;
    aarch64) _dir="agentrq_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/agentrq" "${pkgdir}/usr/bin/agentrq"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
