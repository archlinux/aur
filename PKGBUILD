# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=croft-bin
pkgver=0.2.182
pkgrel=1
pkgdesc="VS Code-style terminal UI editor"
arch=('x86_64' 'aarch64')
url="https://github.com/vitali87/croft"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/croft-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/croft-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('f649f2a479288fd86c30eddeb8af68e040e8f06463763e6070b34931ba2126b2')
sha256sums_aarch64=('62c4d469a85cec38731a96b1bfa609c7159561c3dfd655cdc992355acbea2fe1')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="croft-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="croft-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/croft" "${pkgdir}/usr/bin/croft"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
