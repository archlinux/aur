_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.16.2"
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
    "riscv64"
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
source_riscv64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_riscv64.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('6600a5fcd366ff2b141b3377288b5c73ff60188f1a9ab2cc30cbb245df620d51')
sha256sums_i686=('133c79aec66030673af6d32666e4f6cf3f58756cc7f8c7983abc91b2bcfcdb31')
sha256sums_aarch64=('bf7e886a58ec9765a9e6a0b6aed01288f70caeb8a60983726878aed2272b03ba')
sha256sums_armv7h=('5e7f405c9eb814fbca9cdedf6df27589acbe7bc53f5de8aa73d84f9de838d64c')
sha256sums_armv6h=('637f02eb681473fb5cb2a69bb8d9ae7897a0e573bba724987819c57dfeeae3fc')
sha256sums_armv5tel=('fc3e9d92282eaec6504a742d8b7fce5a645d1ecd64ca13d8a608553e8643ccef')
sha256sums_mips=('6e37759d749233de519ceb5413f458d0ef6fd0a3c3a331bfeededdad34aefae0')
sha256sums_mipsel=('4cfb93ac191452940d8dfbe044490cef43b16e8a4ba08c91f3b2242fcff61036')
sha256sums_mips64=('630ddfe8aeca21057a546b4dc5c93804eb14b43df36d8241101746d5b32d8480')
sha256sums_mips64el=('0e25063a5d765f39fe86ebcd9708b419abaec1533478af56a3bcc8b33ac8dfd3')
sha256sums_riscv64=('ca9404f65fed0e296995e3792bb22b0c6483d349c19f3f47fc4b351202e1e77b')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
