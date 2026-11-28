# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=samyama-graph-bin
pkgver=1.17.0
pkgrel=1
pkgdesc="Graph and vector database with OpenCypher and vector search"
arch=('x86_64' 'aarch64')
url="https://github.com/samyama-ai/samyama-graph"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/samyama-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/samyama-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6dec8f9f705cfb47098101bb81e7ea0d2a6ec3945a96e203983422e0601b9ac1')
sha256sums_aarch64=('90ac723ac7040b2469806bfaf00725997da22f0faab47c60f4db248048a153a7')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="samyama-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="samyama-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/samyama" "${pkgdir}/usr/bin/samyama"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
