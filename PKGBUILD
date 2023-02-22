# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.25
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

sha256sums_i686=('c96968eda75a41c3eb338cce3eae412f0eab64f620d90af64f547b1fc419baf0')
sha256sums_x86_64=('a43d6fb38347581c99984a33760a730570de4b36c4068bb26b0778d4499ff101')
sha256sums_aarch64=('0699273bda8be09a37d5dfef4578ee53fc0959f095bcb7e087ab592c6ffa8a92')
sha256sums_armv7h=('30ebc32afab6e3e3459a0b1e659037cf3d33e95affecebcef2c1e9b035af32ea')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../adguardhome.service" "${pkgdir}/usr/lib/systemd/system/adguardhome.service"
}
