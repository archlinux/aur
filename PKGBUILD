# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentrq-bin
pkgver=0.19.14
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
sha256sums_x86_64=('12ce30c33967866d2287321b492f5cd4f43c5e0c8ad450c9f274764f92ac3d72')
sha256sums_aarch64=('f15b2ce574dfb0f9682a99d6e837034b25a39352d28607827dc1c43fcd94c833')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="agentrq_${pkgver}_linux_amd64" ;;
    aarch64) _dir="agentrq_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/agentrq" "${pkgdir}/usr/bin/agentrq"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
