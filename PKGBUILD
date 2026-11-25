# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clawhip-bin
pkgver=0.6.18
pkgrel=1
pkgdesc="Event-to-channel notification router for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Yeachan-Heo/clawhip"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/clawhip-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/clawhip-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('df5e567ecbeec9aa00917fdb83b98cf71c9bfd0e11e3d74ab839e0464b3d6b5d')
sha256sums_aarch64=('6f9193864527ecf20d5ed1c6055b4240cf8bc32852e898cecd4eb14dd5f6d541')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="clawhip-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="clawhip-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/clawhip" "${pkgdir}/usr/bin/clawhip"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
