# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=resinator-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Cross-platform Windows resource script compiler"
arch=('x86_64' 'aarch64')
url="https://github.com/squeek502/resinator"
license=('0BSD')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/squeek502/resinator/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/linux-x86_64-resinator.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/linux-aarch64-resinator.tar.xz")
sha256sums=('e007ea8659151111d77bfa551efdeb22243f0814b7d029d34127705747c76208')
sha256sums_x86_64=('6f78ce419218eef3b20765c1f1077d3d56cac19e2d48ad5b421a33851e02b4cc')
sha256sums_aarch64=('e4e4c168a035ba42a2bcf7b23afa0927e0bf8e242bf9cf7da31b31bf95e51bdf')

package() {
  install -Dm755 "resinator" "${pkgdir}/usr/bin/resinator"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
