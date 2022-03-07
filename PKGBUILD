# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.5
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

sha256sums_i686=('c1dce3ecff87866eb98b9858e25d93cb8f3a5b8ef772867266709bcf1f4fa2ba')
sha256sums_x86_64=('b1941ef2b3580f48014a935e5d2fb885baa84f99d415b910488ddce95b90382f')
sha256sums_aarch64=('f49b06cc57f4dde9f60a5ae876095112c62aaf0afa8ffbf2a6c7c455a3330932')
sha256sums_armv5h=('e0b133fbaca67210fe7e7fc5e594bb41d4764f972d582990703f9f6924a6995f')
sha256sums_armv6h=('43e9247720cf2db7a018fc386a5e11e7d87823664535528dad72b913c310f083')
sha256sums_armv7h=('149da0484dabbf3730f88eb05769202401cb7fb52cadae559cee6ddeef4db12e')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
