# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=anymd-bin
pkgver=8.5.19
pkgrel=1
pkgdesc="Convert PDF, Word, PowerPoint, Excel, EPUB and HTML to Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/sylphxai/anymd"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sylphxai/anymd/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/anymd-linux-x64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/anymd-linux-arm64-gnu.tar.gz")
sha256sums=('b8082a5507c4783ec27b90c2b6016d27d3e15ae70180f53d1f5f74a15a834d8e')
sha256sums_x86_64=('22340dbb4b6247b5bce26859e49c93d44f4059bf26f2a48500e85956f3c4814e')
sha256sums_aarch64=('1bc1bfb7561948cc653035817e70cd2aad451ee26c07d49d8c8b5a1d9b63d177')

package() {
  install -Dm755 "anymd" "${pkgdir}/usr/bin/anymd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
