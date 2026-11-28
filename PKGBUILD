# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-camo-bin
pkgver=3.1
pkgrel=1
pkgdesc="Secure image proxy server"
arch=('x86_64' 'aarch64')
url="https://github.com/cactus/go-camo"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cactus/go-camo/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-camo-${pkgver}.go1273.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-camo-${pkgver}.go1273.linux-arm64.tar.gz")
sha256sums=('4d6ddf005ea9b925c44a1725a89e6b8510e98179f1aee6f1081d1315bfe3cba7')
sha256sums_x86_64=('021c8edcf884dc0f618b8f3ed6de0ce7bf8976697940523e9ca7e263bd769505')
sha256sums_aarch64=('e29660f499a071aac7c140f1ea0c7578b138510e805b0d641669c9daacf6a2f6')

package() {
  install -Dm755 "go-camo-${pkgver}/bin/go-camo" "${pkgdir}/usr/bin/go-camo"
  install -Dm755 "go-camo-${pkgver}/bin/url-tool" "${pkgdir}/usr/bin/url-tool"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "go-camo-${pkgver}/man/url-tool.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "go-camo-${pkgver}/man/go-camo.1" -t "${pkgdir}/usr/share/man/man1"
}
