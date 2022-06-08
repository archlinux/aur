# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.7
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

sha256sums_i686=('3f63ec49da56e62da1c013d429bfaf8987b09551d3111fde064c0fa779286b0a')
sha256sums_x86_64=('71b4e5541946745804cf66faa5bd1227bc947f8c055e76702c2926bd7ef91735')
sha256sums_aarch64=('4ca6776ce339a2adf41ad2e7f627cdc98ebed8b8b89dfd7eaf62f41311bfd747')
sha256sums_armv5h=('78aab72050d1d1722bb37b58ab74422df908e839b35b008dafd9a538fb8cb984')
sha256sums_armv6h=('226ce75c40ce1c772e8c0c60f16498364d5f0598ab715c41278709a5c6b9d5a0')
sha256sums_armv7h=('bb3b977e59674c1aa41b2826f7c8b79116d39913af87a4be983fcbdd583fba0b')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
