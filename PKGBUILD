_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.16.0"
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
source_mipsel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsle_hardfloat.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat.tar.gz")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le_hardfloat.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('fbd678288a80a7999b4b909460cca09081cddf0389336613bd8fa30470d7f48d')
sha256sums_i686=('ebe37283a69f8940b1e4deed0d4fb65b070b44d2496fbe69ceed9f473a67cd19')
sha256sums_aarch64=('013fcce27323bd44ea417690b1834817f7356392226808fece5969048a225c8c')
sha256sums_armv7h=('93bee0aed32307869acb71e2b3e02af9019e6ced7a1389d87e6ec7d2e96f5ecb')
sha256sums_armv6h=('d13938e075ae0021ea6f8966d007e8c31e2c3b2144ffac7e6c625c3ec6745a8e')
sha256sums_armv5tel=('4e3c1dbf6d86d18b9fee8677280b71af8c05aa296fbffb78efdd9437b64c06f4')
sha256sums_mips=('c8dbef8f16530d5ec53a7fba3db2002e21ec7cc961edd1906fe9eb48b1c15c2b')
sha256sums_mipsel=('4680acc247ef7c79c66cab39c1801922a9983245ff5733c83a021834030b6790')
sha256sums_mips64=('e3ec1462953bee373327215c9097a57e8e95e60ecc3d563e7319d3e69db5182b')
sha256sums_mips64el=('4c25441a2bcdcf5628b9ee6accd54882a4890f997e9c09e516dfaa0e0ea28077')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
