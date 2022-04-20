# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.6
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server (binary version).'
arch=('i686' 'x86_64' 'aarch64' 'armv5h' 'armv6h' 'armv7h')
url='https://github.com/AdguardTeam/AdGuardHome'
license=('GPL')
provides=("${pkgname}")
conflicts=('adguardhome')
install=adguardhome-bin.install
_releaseurl="${url}/releases/download/${_pkgver}"

source_i686=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_386.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_arm64.tar.gz")
source_armv5h=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_armv5.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_armv6.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_armv7.tar.gz")

sha256sums_i686=('03a22c0d16d11f2534f8850a92bb9d2af94a88991534db35d8caca43a465a4c4')
sha256sums_x86_64=('9cf72a024d26d5ef62ce4ca506e35c6ad1c44a0bd27b047e30a995773f8705e7')
sha256sums_aarch64=('213919755534dc51bd01400c803ea7942ca2a0f257df9ef007d9b58d874f952e')
sha256sums_armv5h=('ee77bacc11e57d34b1327856ecf8e2b889fd06dca3c3766967bd1df5c3a4103b')
sha256sums_armv6h=('57c0b073845c5351ed630191772c8dcb7cd8d3678ed019390ca9c1e37b7d73e5')
sha256sums_armv7h=('164041df108e04c7cc06f3e3e03d6156b304566f352595f34cba63229762e505')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
