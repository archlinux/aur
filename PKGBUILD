# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=az-pim-cli-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="List and activate Azure Entra ID PIM roles from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/netr0m/az-pim-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/az-pim-cli-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/az-pim-cli-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('5240095723cc3ccc27d300dc691863f1232990c094b76772f1eb51b139030912')
sha256sums_aarch64=('baf108036dfa213e43b10a87abc27c9e4b95caa612402b50b1640b408fb7c5f5')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="az-pim-cli-${pkgver}-linux-x86_64" ;;
    aarch64) _dir="az-pim-cli-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/az-pim-cli" "${pkgdir}/usr/bin/az-pim-cli"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
