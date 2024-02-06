# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.44
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

sha256sums_i686=('de57d2fa878683d05a2d1558dda39176bfb044f58d8134a2531b3d291ed07e9d')
sha256sums_x86_64=('bd19f93c47a8a893639e4ef28161e161708767c898cc10471ff3fefbc35a3a76')
sha256sums_aarch64=('98b5a0c0645b6622dd638aaa818a8d7a3ac30cc8fbfa42aba7de36f20971d34e')
sha256sums_armv7h=('49bf8be6745f18610daa5c0d9c71217b3699b451eeac3b1747b77b810600f835')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../adguardhome.service" "${pkgdir}/usr/lib/systemd/system/adguardhome.service"
}
