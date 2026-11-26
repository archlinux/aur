# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sherif-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="Opinionated, zero-config linter for TypeScript and JavaScript monorepos"
arch=('x86_64' 'aarch64')
url="https://github.com/QuiiBz/sherif"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/QuiiBz/sherif/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/sherif-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/sherif-aarch64-unknown-linux-gnu.zip")
sha256sums=('2d800ccfc40dd5ce381fafa02c6d3bf1f2d75c3f4ba4b5a7215b0fe74b98950f')
sha256sums_x86_64=('951eac26e499bbf64c2a227058715a343c20323b89e2490f24acea1d3048af9e')
sha256sums_aarch64=('eb04a6f77ee3911eec7b5a92645df6cb48a059139d74f5604c6df8c7b714bc6c')

package() {
  install -Dm755 "sherif" "${pkgdir}/usr/bin/sherif"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
