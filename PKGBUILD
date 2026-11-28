# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=semtools-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="Semantic search and document parsing for the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/run-llama/semtools"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/run-llama/semtools/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/semtools-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/semtools-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c37bf156c878f50518d00c7482e62e59108614236032601a8ce7adb3f145dada')
sha256sums_x86_64=('f13d60ccbf64a9a7a9d8860d60f2b4fdf86a445d737220c5286b92e7eb87f54d')
sha256sums_aarch64=('b7a4dccd10f3ad7b544e65943216304fa59195f486d06e25ace6e2ade38a4d2c')

package() {
  install -Dm755 "semtools" "${pkgdir}/usr/bin/semtools"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
