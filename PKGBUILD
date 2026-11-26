# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tyson-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="TypeScript as a configuration language"
arch=('x86_64' 'aarch64')
url="https://github.com/jetify-com/tyson"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jetify-com/tyson/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tyson_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tyson_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1')
sha256sums_x86_64=('e240a84054c13322cd3e18d529c93933cd29209b1b8a54bdde34d8360cbf549d')
sha256sums_aarch64=('a8310fa58286f76bd0d3f9aa684517210c85c1ffb5dd79c5da30319455c3019c')

package() {
  install -Dm755 "tyson" "${pkgdir}/usr/bin/tyson"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
