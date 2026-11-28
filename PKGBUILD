# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=supercov-bin
pkgver=4.29.19
pkgrel=1
pkgdesc="Code coverage for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/supercorp-ai/supercov"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/supercov-cli-linux-x64-gnu-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/supercov-cli-linux-arm64-gnu-${pkgver}.tgz")
sha256sums_x86_64=('0c30b39e9e5623c6c68c6d2ab60be2d7230e7ead4e04be12a116bd93d1145d22')
sha256sums_aarch64=('6bd27b9bc92aaa58187bde872bafbca27000f4ff9a0557acd7cecdefaa5a0234')

package() {
  install -Dm755 "package/bin/supercov" "${pkgdir}/usr/bin/supercov"
  install -Dm644 "package/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
