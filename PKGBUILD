# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=appbuilder-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Create friendly command-line wrappers over operations tools"
arch=('x86_64' 'aarch64')
url="https://github.com/choria-io/appbuilder"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/appbuilder-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/appbuilder-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('6585e8ba59e317e6497decacc7ab4dadeb34993adb9355e735b81331a0334ed3')
sha256sums_aarch64=('4c9f0b0f9d97d648af326896ede5e4bf462f093eacd309ac0c3b4bed0d2e8112')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="appbuilder-${pkgver}-linux-amd64" ;;
    aarch64) _dir="appbuilder-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/appbuilder" "${pkgdir}/usr/bin/appbuilder"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
