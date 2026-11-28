# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=moling-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Computer-use and browser-use MCP server"
arch=('x86_64' 'aarch64')
url="https://github.com/gojue/moling"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gojue/moling/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/moling-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/moling-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('33db2390e786fbb89efb85127c1f986c0bf1af6d03c57b1d3124ee3e5b107da4')
sha256sums_x86_64=('9dad5db4eb882664eac23b46e27ddd48215a12cfa46247a0d6aa4155708cb99e')
sha256sums_aarch64=('f296c22b0c28ce9de3c191ba580aa3d3cef13b73aaf892cb6b38f893b5c62ca6')

package() {
  install -Dm755 "./moling" "${pkgdir}/usr/bin/moling"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
