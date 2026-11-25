# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=anymd-bin
pkgver=8.5.17
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
sha256sums_x86_64=('8280a3e55f183f4a440abb1b63f50d706d57830b98b34a568ddf9442ae131a29')
sha256sums_aarch64=('299cffe6c4129c96c23143c6e6d719289cf378c964e0622ac80b0edbd7f58f12')

package() {
  install -Dm755 "anymd" "${pkgdir}/usr/bin/anymd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
