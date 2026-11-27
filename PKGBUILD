# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cyberapi-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Small, fast API client built on GPUI"
arch=('x86_64' 'aarch64')
url="https://github.com/vicanso/cyberapi"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cyberapi-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cyberapi-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ba6439b69bd8057cac6790dbc441880f8a587cb36dbe401be2b4d2c86cd0f1d9')
sha256sums_aarch64=('d97a03fd76f140e8a972c2b4d482af54ccbc0e5447b46cb46cb0bf88a329d9a9')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="cyberapi-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="cyberapi-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/cyberapi" "${pkgdir}/usr/bin/cyberapi"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
