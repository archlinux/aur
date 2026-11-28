# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ggcat-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Compacted and colored de Bruijn graph construction and querying"
arch=('x86_64' 'aarch64')
url="https://github.com/algbio/ggcat"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/algbio/ggcat/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ggcat-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ggcat-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('92666849ab08c0d99383a10b8a4117f8703e3b21d55db58835aba9f018c88f08')
sha256sums_x86_64=('9d4bb36726bab2d267515cd1ccbc49754742c94bd9ad64c38827cba53ccfb834')
sha256sums_aarch64=('b7e07f21c18e883dd828915d5bdf852f398b340cea9553d8c55ea2961afedaa0')

package() {
  install -Dm755 "ggcat" "${pkgdir}/usr/bin/ggcat"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
