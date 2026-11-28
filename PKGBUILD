# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chaitin-cli-bin
pkgver=2611.0.1
pkgrel=1
pkgdesc="Command-line interface for Chaitin security products"
arch=('x86_64' 'aarch64')
url="https://github.com/chaitin/chaitin-cli"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chaitin-cli_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chaitin-cli_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5b8c95c8ec0281dc4b131f9291b30d0cca1379895763338273af790bcc5be92a')
sha256sums_aarch64=('eb6f44497a55c3f71203068769d2161c30570937ee5d18af5a779651be4415b0')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="chaitin-cli_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="chaitin-cli_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/chaitin-cli" "${pkgdir}/usr/bin/chaitin-cli"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
