# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fileview-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="A terminal file browser with image previews, Git status, search, and an MCP server"
arch=('x86_64')
url="https://github.com/Hiro-Chiba/fileview"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Hiro-Chiba/fileview/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fileview-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0a40b4c2cd3ffb7a03c37af716fe0caa6ddfe62ac07f3005f9c4443906ceb40c')
sha256sums_x86_64=('b990a7add32f0c2b0169ce3bad418775ab8390bc4846c3654ca2b7284c145866')

package() {
  install -Dm755 "fv" "${pkgdir}/usr/bin/fv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
