_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.9.1"
pkgrel=1
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv7h"
    "armv6h"
    "armv5tel"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "mipsel"
)

url="https://github.com/jeessy2/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.service" ddns-go.install)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv5tel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv5.tar.gz")
source_mips=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips_hardfloat.tar.gz")
source_mipsel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsel_hardfloat.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat.tar.gz")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64el_hardfloat.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v${pkgver}/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('7eb624b01c3f39f60fef804d58186e790928b969e39e98d9672e6067c00a569f')
sha256sums_i686=('132489ea261d88ca90d24b2df7801d6e9999525e5f887dbf56a1fc55f03ea4ab')
sha256sums_aarch64=('08a260ab9e87980ee30035f25db4e534ffaaf0cb90091858d9623e38da916966')
sha256sums_armv7h=('ae9ac6985b6f8acac35b5e4a0aaa3c9aef50d3a9e7dad8937ce09e538c533047')
sha256sums_armv6h=('69b36dc123f726a4f0bbf26f865322e50c2bd295dce4b8f1f93a418196fbf372')
sha256sums_armv5tel=('de32303a21a72a855b8124c3e6a67035b1ec7414b4c3c97ae2623e09cda68dab')
sha256sums_mips=('de0ae58f568ac2beb3bce7474de8719496caf828f21ef90fdedc3f84ba913913')
sha256sums_mipsel=('7ccd828aa095e0190a1978066ce320400539bb7b26eb68f25e0f36a8e288977c')
sha256sums_mips64=('c3d61e0fd79a5daf3c29f6c6d87873f1c5fa8134e1e60dd29e13fd271affac7a')
sha256sums_mips64el=('ddb2e37f62e37736099191c114ac797943eaa38fffbbdc235ff67856bafd2568')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
