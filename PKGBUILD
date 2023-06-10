# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.31
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

sha256sums_i686=('ae7f2adcde154fec63b2ce8e598956f43b40cbec5f690a2b898d08b8c22f6ba6')
sha256sums_x86_64=('39d19c7009e5a34806401d08585417f4f2b3d3705e52378ac0abd38d8292e645')
sha256sums_aarch64=('10a5a5870824b2642fe4e5e67bfe151d51524443ac2363c69968fd02b06e90fc')
sha256sums_armv7h=('a794873e9977dd0f091a6a910441490fce1572e7859925f06e9dd1b2c46c2488')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../adguardhome.service" "${pkgdir}/usr/lib/systemd/system/adguardhome.service"
}
