# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.8
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

sha256sums_i686=('ac3e540e400c7817e7ac4a717d95a00d011437ef360fa525da08dc952f00f025')
sha256sums_x86_64=('6ee069e566758c8cd00dbc7354e642fedde2bf50f0d0ffcf377c0605b19a62f5')
sha256sums_aarch64=('77a678e8beaa7978b950d3d8dff9e54c9bd50ae43495a9ad478f59ef73bced67')
sha256sums_armv5h=('32b05fad5dc404d57fee1b019489e1f61532df82252723947a3db376df2bb99d')
sha256sums_armv6h=('15c0a3e3cb7fbbb0d1b13d732a75f936f02d633266c787bad104b00dfd759157')
sha256sums_armv7h=('6fa4bd5407cec2e9edce4378689cd99e8b781d801f6c259677ee61c688b9a61c')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
