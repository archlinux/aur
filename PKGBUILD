# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.11
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

sha256sums_i686=('548bd0f9d84f8be8021a80b0c269cdb1c14fa9f4c236a65d66c3181584850ae1')
sha256sums_x86_64=('69367f9dfcc90495fba55ff19ffed0c0fbcaf79198e4323378db383bfe94043c')
sha256sums_aarch64=('6983cc32323b6b316d194bcfcb62a74b4a3b9539adb0e68e56020509691f362e')
sha256sums_armv5h=('afa30005b511f6c4faa2d47e63b8f7e16ed927034292f55e8f12d4181035e167')
sha256sums_armv6h=('5db230a025e9ea26d9372844a188d5e2943b3c635588d5192627b91e0da67f8c')
sha256sums_armv7h=('5bbe85c2ee27f65ab89b3f224675bfbd3242d5bfd22aa9daf9748df477ac6e18')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
