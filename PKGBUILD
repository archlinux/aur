# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=apexo-code-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="General-purpose terminal coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/cluster1900/apexo-code"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cluster1900/apexo-code/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/apexo-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/apexo-linux-arm64.tar.gz")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('23828fa4e7a468fcd6004b731dd54451d2a20593267c43daef849077ecd57fdc')
sha256sums_aarch64=('41100a0e6f9655cd29652d3b1bd5845f46a22c875bcab42dc9803ab4f66c6c47')

package() {
  install -Dm755 "./apexo" "${pkgdir}/usr/bin/apexo"
  install -Dm755 "./apexo-workflow-script" "${pkgdir}/usr/bin/apexo-workflow-script"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
