# Maintainer: mavxa

pkgname=vesselix-bin
_pkgname=vesselix
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight local-first Docker dashboard"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mavxa/Vesselix"
license=('MIT')
depends=('docker')
provides=('vesselix')
conflicts=('vesselix' 'vesselix-git')
source=('vesselix.service')
source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-aarch64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-linux-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-armv7h.tar.gz")
sha256sums=('26b1ff5ece3a4b0c0b679ab03abaf4080882e91d987ab5b2cb313b62fd745704')
sha256sums_x86_64=('932236797a7664404286b331a21c3d1512968623ec734f200ebb6709f80ec9e3')
sha256sums_aarch64=('5fbab4dbca7e4167706aa18c2dddd79070f9b6e3b28f1ee65f9151a74ef1b951')
sha256sums_armv7h=('69a5bba012a148180bfca4420763392aae1f6988722f207c5cbdb16e3964eba5')

package() {
  install -Dm755 "${srcdir}/vesselix" "${pkgdir}/usr/bin/vesselix"
  install -Dm644 "${srcdir}/vesselix.service" "${pkgdir}/usr/lib/systemd/system/vesselix.service"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/vesselix/README.md"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
