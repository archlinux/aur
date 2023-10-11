# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.39
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

sha256sums_i686=('1bd4f5f0b0ff3ec3f5b4c5291c1f6ae6d64ba8795eda9c73c6d8f189876615b6')
sha256sums_x86_64=('4d715426773fd15caccbfc8ec4517b4cfa2e4a78ee82c51ce1f92b34618e8e4c')
sha256sums_aarch64=('e909892f9cca99d6c81df42cd3cc216d8c38e0b7d2af4c56d907441e76aeb168')
sha256sums_armv7h=('5f6a02e2901f3e49c9e6ba72f47d1817059b2de08992ce3fb5bf79509786e860')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../adguardhome.service" "${pkgdir}/usr/lib/systemd/system/adguardhome.service"
}
