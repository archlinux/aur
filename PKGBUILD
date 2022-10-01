# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.14
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

sha256sums_i686=('a1fc75e87ebeb524ce133f94b935cacf3571de1444c16f048c4a80817767a908')
sha256sums_x86_64=('91fb40676b27bf7c6cad53eadf2e6e24ac19847b4d3bf5502f52c1879ca4fc30')
sha256sums_aarch64=('255cb67436467c7faf661349f78c2fa18637234b5003a09267f735ac18a4656c')
sha256sums_armv5h=('71cbfabf2d15ecb908271673f12522d276a60e3b4bcb3f2345fefa540805243e')
sha256sums_armv6h=('dc4b5f7d9e5e9f61f4c9e30bade3570cc509619840379b7649facfd0c5047eef')
sha256sums_armv7h=('2c50f88e365ef384ee04902f597e0a14039ec788a0c689ead9ef46be734c9511')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
