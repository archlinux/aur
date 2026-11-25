# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deslop-please-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Opinionated linter that removes sloppy code"
arch=('x86_64' 'aarch64')
url="https://github.com/deterministic-machines/deslop-please"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/deterministic-machines/deslop-please/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/deslop-please-x86_64-unknown-linux-musl-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/deslop-please-aarch64-unknown-linux-musl-v${pkgver}.tar.gz")
sha256sums=('712b84686e2ebda4ae628ceee0c96e176eab413a7e9f730ad72bb0a2612f5a25')
sha256sums_x86_64=('f063862159d6f77818b67420ecb05d700bfb8f92b478cf7a8727843276cc6b0f')
sha256sums_aarch64=('05cd671476cecbb196c9eace2dd2f097199f8cfb554791c27c1c5e3a0717fbb7')

package() {
  install -Dm755 "deslop-please" "${pkgdir}/usr/bin/deslop-please"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
