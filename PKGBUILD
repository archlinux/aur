# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.3
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

sha256sums_i686=('64f1e617128b275a314f5f0fe850efef8fe5782ce51124eb84d62e0bc4fabbe2')
sha256sums_x86_64=('c8ebe4122983a7ae3a0420855767e799519ee91f20785971b562df3cc550f549')
sha256sums_aarch64=('6b236fd8ed067b7753e9800de125bf82cca812b081dc1258b31fdd68c6c61e3b')
sha256sums_armv5h=('356e588ace38157685a1eb78bf677c2b5f0928e1beee93b6ee743d1531896007')
sha256sums_armv6h=('6dc857a68fc06d248c6545c02729b7d67a605f46ca6170d16c8947d1472306f5')
sha256sums_armv7h=('802ab5da539ff168d98c7dcdf9bd760f78869d7036801b77685981f67bd4e63a')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
