_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.16.12"
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
sha256sums_x86_64=('3469cd232ebf67ce8a85406f7b9a9bbab91b4ab4eba740a9a09f378f8a1cc1d9')
sha256sums_i686=('3c72b9651fc6442ad0da77e8526cae1e71d666e6364628416aac52cfbd711ff2')
sha256sums_aarch64=('0aa8a0ec68c91271b2047cbe3346da7a185c8e59ed35c605b38521d9b65037a4')
sha256sums_armv7h=('93f6178df1276628c20c8b40f812ed2f9367ee0c8b753ca887f62c3eda206337')
sha256sums_armv6h=('9ceadf4b18f570be15c7650776be1712146283242623031dcc7e93734b087eb5')
sha256sums_armv5tel=('46b15d0e4acd47c070f33f9ce186da5f50cb32429fe7338ab8b12edda2f8f934')
sha256sums_mips=('795250bbad1c9dafa34b51fcf6889c97624449ad8d3c9c519b616e6859188af1')
sha256sums_mipsel=('5b24097abf83ec056d9b27fe43cd9714990687720d779c52049137a9cb495330')
sha256sums_mips64=('754416b449c861c68be134301e4051355ca50dabe41d0ab4700d497187077b7a')
sha256sums_mips64el=('20e01bf53151965d5bce3434685780c66e0cca2b53b9c8062729b7c27c980253')
sha256sums_riscv64=('89ba246cecc48aaccf444ce7cf96afcd31b889ef988e299320088e5c45ccd5b2')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
