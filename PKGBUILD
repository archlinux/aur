# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deslop-please-bin
pkgver=0.1.6
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
sha256sums_x86_64=('64a6b59c249188c2b2d69e0eb9e1298afe8f7321bdf9313640ea54e1f423a236')
sha256sums_aarch64=('dba3ba5e34b6f309441108353e5ea50160899c946a8db249bdaaf2ba761e0e65')

package() {
  install -Dm755 "deslop-please" "${pkgdir}/usr/bin/deslop-please"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
