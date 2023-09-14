# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.38
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server (binary version).'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/AdguardTeam/AdGuardHome'
license=('GPL')
provides=("${pkgname}")
conflicts=('adguardhome')
install=adguardhome-bin.install
_releaseurl="${url}/releases/download/${_pkgver}"

source_i686=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_386.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_amd64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_armv7.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_arm64.tar.gz")

sha256sums_i686=('451149dc85f34077beaaeb27be099089e1c14ab05b288bd59ee7017af8d34ca2')
sha256sums_x86_64=('0e45b77c8ea28365aaf8b88fed9b9ed10e9569e85d5e38f63c56e7915a53021f')
sha256sums_aarch64=('551dcc10f9d70f6efca0762f9b3011bb0672526ce2e2177b3d594c3b50e4e7d6')
sha256sums_armv7h=('c49b9fa8cb60deb3d04d0a8fa4ea322aa830e470dc1ad649bc31f1c97361bdaa')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../adguardhome.service" "${pkgdir}/usr/lib/systemd/system/adguardhome.service"
}
