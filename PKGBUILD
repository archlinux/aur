# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.106.3
_pkgver="v${pkgver}"
pkgrel=2
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

sha256sums_i686=('f5a1b20bbe96cb3c07940911ef692e35c77febc5dd5960b781f4fdd88b96d8b6')
sha256sums_x86_64=('a89332993c66a0f94886e243eb3141596c33cfe085c7ef7e30ead1885b40e086')
sha256sums_aarch64=('67985e90dc5e7a6a96b0cbbb9f75139980b374aa795eca7d92ed06d8b3aa0bcd')
sha256sums_armv5h=('9847a8c5874642c957b6e9876e0cc1a892713b04add0e83bde6879b959185387')
sha256sums_armv6h=('2402552a162091edaef4dc707e9f6fb8792d5754343a2dbcee430a6ba75968e6')
sha256sums_armv7h=('8bbc0e15ab68b2a11630e84f318f755f4a6f92ea9d0fa727e107f060ed6f5a2c')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
