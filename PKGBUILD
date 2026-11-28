# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zwasm-bin
pkgver=2.12.1
pkgrel=1
pkgdesc="Fast, spec-compliant WebAssembly runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/zwasm/zwasm"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zwasm/zwasm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zwasm-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zwasm-linux-aarch64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('a7bcc320fe4080975bf060302841544d865a4c02ac1dc6b0913fa635c70e86bd')
sha256sums_aarch64=('6b36cd6212dd4ce8f823dc6805ecbee92622e383ba4a194118a0daa8c8592609')

package() {
  install -Dm755 "zwasm" "${pkgdir}/usr/bin/zwasm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
