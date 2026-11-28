# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openagentd-bin
pkgver=3.63.1
pkgrel=1
pkgdesc="Local coding agent with a desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/lthoangg/OpenAgentd"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openagentd-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openagentd-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('460603cdaedc27fd2344cd011226b9f3ceaac9248ece4d1700bf04ed95c41bb6')
sha256sums_aarch64=('644dbadb721aad7ff422d41870832c40576d173db41f2a277ce61fcffb0e2531')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/openagentd" "${pkgdir}/usr/bin/openagentd"
  install -Dm755 "${_dir}/agentd" "${pkgdir}/usr/bin/agentd"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
