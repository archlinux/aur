_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.12.1"
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
source_mipsel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsle_hardfloat.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat.tar.gz")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le_hardfloat.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('d67c1ce7a755ee3cb16c2fbadbc8ef11f9404875e85061ac4c11e1f876574847')
sha256sums_i686=('7face31277d994f3c71c18a96ca407248d37cd371ef4c702ef0b963eafcd75a8')
sha256sums_aarch64=('3a7a96ab5e84f069326cf663fc623e82ca98fa11c5f37883c3d2d4c645429d49')
sha256sums_armv7h=('9793305cb27757dd4e937cc48ab08187d6a618a55da55286ff1bd8259a97e737')
sha256sums_armv6h=('c7e82eca014a7d59fa27a62584162064285333a2cc1fa742b97abbeff151047b')
sha256sums_armv5tel=('8a9e4db62117827b3b7b3f239a50277025c3cfd4ca96e74e74a9658286f836c7')
sha256sums_mips=('0dd4b3951efe293910e1fdfa1b93d7d79c0502ae0c1cbb5582859be86e2f2cda')
sha256sums_mipsel=('b9ff9399ddf1f99a400d1583d4025093e37dabfa550db715cdc105e638491f6c')
sha256sums_mips64=('e82d2ca3cd196a9f248a3767846fd6c119dd28d83f268c833a5eb51c92c12ec3')
sha256sums_mips64el=('14a539155057bd1380da3a1ea970da2208d508aa0e578faa0dbb8512ea7c7d88')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
