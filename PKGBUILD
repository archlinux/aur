# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.12
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

sha256sums_i686=('30bf56489c104c2f05d3b30e4d00696571ffb474a56d01330287c6a631d9acb5')
sha256sums_x86_64=('7c64817d0ce56106ec644c4eaacc5ad9975bfe0be8d1cf4edf5df389292f3a36')
sha256sums_aarch64=('591f2899f5b9b9d3265cd2ae5087ea757be082e986e0f6f580448957d619f6b7')
sha256sums_armv5h=('72fc57d2a5085f0a8a813d0342854557bc12a923afa0eae321f122044d0d339c')
sha256sums_armv6h=('686a57b452829310ac844d6e7f985e8addbf73772ff4f2a8d05d063b9d3799cc')
sha256sums_armv7h=('d80be1d4802d227015659ae24234603e9073eb33db917a28030e2acc92bd1244')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
