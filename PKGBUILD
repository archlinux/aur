# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=feishu-cli-bin
pkgver=1.44.0
pkgrel=1
pkgdesc="Command-line client for Feishu/Lark with Markdown document support"
arch=('x86_64' 'aarch64')
url="https://github.com/riba2534/feishu-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/riba2534/feishu-cli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/feishu-cli_v${pkgver}_linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/feishu-cli_v${pkgver}_linux-arm64.tar.gz")
sha256sums=('44ad93460de060369cbe39b7a6d0ad7c36b19783d0dec7535fffb0452221b507')
sha256sums_x86_64=('e01baf2579904782da68773a26d899d0d9e764bc47e92cffcd1015c23d398184')
sha256sums_aarch64=('c9a8a4255e5f4330007990dd55e9740e988d5e7625d87fdbf1607e47a4f543bc')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="feishu-cli_v${pkgver}_linux-amd64" ;;
    aarch64) _dir="feishu-cli_v${pkgver}_linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/feishu-cli" "${pkgdir}/usr/bin/feishu-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
