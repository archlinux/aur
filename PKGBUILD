# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.0
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

sha256sums_i686=('816ca56600a4f9b19fd61da54d7da04675b7f4fec2da4b342c7eda9c95ba24ac')
sha256sums_x86_64=('8360c8797c1aa934dfb21632c833476ce539ed851bbb15c32891c5a8a16bab3c')
sha256sums_aarch64=('3e8bddb8645c7d251b86a5f57314603249cdf265897a48e3a41d1bd53135fff8')
sha256sums_armv5h=('8cc84e052b7982be38f13741af2976edfd1d8beeac7ef98eaba40be4f18609e0')
sha256sums_armv6h=('691a11cc9e0495d8ffd083a3f1232f190c86da63d1e23fd924e87af68d26cd98')
sha256sums_armv7h=('bf1662c2f6b83f9280f8624df107f4f82d887b40f48e448f227428e0b386f455')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
