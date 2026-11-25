# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentrq-bin
pkgver=0.19.4
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
sha256sums_x86_64=('ee5fa0f460b1ba383dd54cbd5044c11456da086f7c84feba7d575d694698d591')
sha256sums_aarch64=('9ca15c357ff3cc10666c4a6e890fe45958642b3c2365e1e31e0710e2434ed08d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="agentrq_${pkgver}_linux_amd64" ;;
    aarch64) _dir="agentrq_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/agentrq" "${pkgdir}/usr/bin/agentrq"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
