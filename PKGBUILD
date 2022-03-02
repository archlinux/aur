# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.107.4
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

sha256sums_i686=('37e4b605652c9041ede588e99dc9a2bab76043a4cddf94d637c66fedb3376b99')
sha256sums_x86_64=('a7aeb97c1da55522e95886254cd5be6463a8869a1b76f3acd00210d65f419661')
sha256sums_aarch64=('a289a42077900d3343a7a03a09c32fdacf3d3e4b8aa46555e222c2c5c8f45ec7')
sha256sums_armv5h=('90f22e3cb980d2f41ba6da27cd1296f919fd6d7b46123fdcb6c78c0a2d180246')
sha256sums_armv6h=('2c82501a1939ce48e7a5a1c651b3faa32c5c891bad12febb5b52998908e3feee')
sha256sums_armv7h=('6483cd7635fa78a71798dad796fbb7cf95b27370510e3f77c0c879412b3be987')

package() {
    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
    install -Dm644 "../${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
