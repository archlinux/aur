# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=purrcode-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Judgment-first coding agent runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/Weilin0723/PurrCode"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/purrcode-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/purrcode-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9ab0df9661f97ab757a0a1bcbdaae42bd85f6f13536fd25169e2defa363eb470')
sha256sums_aarch64=('418b10348c5f1459840836ede60581d8411c411dd9019d54c3c7f6d77ddbc5be')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="purrcode-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="purrcode-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/purrcode" "${pkgdir}/usr/bin/purrcode"
  install -Dm755 "${_dir}/purrcoded" "${pkgdir}/usr/bin/purrcoded"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
