# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fen-bin
pkgver=1.7.28
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'aarch64')
url="https://github.com/kivattt/fen"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kivattt/fen/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/fen-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/fen-linux-arm64")
sha256sums=('9c155540f838683ad44be7a5728ba422c64afcf82532f84b3e3efa53c99d7e3e')
sha256sums_x86_64=('49fdaf84e81ce72ad4ecbef594ce9886d5c923e0eaf6f03fb0a9225f7cc4f03c')
sha256sums_aarch64=('104ea4b376dec04c23adca8c1c69ee9a09906be48642695024bb2a30c9634310')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fen"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
