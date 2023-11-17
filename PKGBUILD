# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=clash.rev
pkgname=${_pkgname}-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Continuation of Clash core project"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/MerlinKodo/clash-rev'
license=('GPL3')
depends=()
optdepends=('clash-geoip: A GeoLite2 data created by MaxMind')
provides=(${_pkgname} 'clash')
conflicts=(${_pkgname} ${_pkgname}-git 'clash')
source=(
    "clash.service"
)
source_i686=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clash.rev-linux-386-v${pkgver}.gz")
source_x86_64=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clash.rev-linux-amd64-v${pkgver}.gz")
source_armv7h=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clash.rev-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clash.rev-linux-arm64-v${pkgver}.gz")
sha256sums=(
    "9847a046071f4c1b92e71c3cb3b214cf5d19c4dd25ad8326e70c58c55b1e9deb"
)
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
}