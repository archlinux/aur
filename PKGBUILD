# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=anymd-bin
pkgver=8.5.16
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
sha256sums_x86_64=('0f6ad01f246e9e380e0c0691dba039cd520258f50abb79a911d1e84fab2d1bb7')
sha256sums_aarch64=('b4b1cf515b53df91b13af121715aa4103fcd68049c13573488edfc3e87fc06f4')

package() {
  install -Dm755 "anymd" "${pkgdir}/usr/bin/anymd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
