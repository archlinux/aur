_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.14.1"
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
sha256sums_x86_64=('d0d6ee894488ae9ea3f071a7ec4400c235cc68d943b90b051ccdf92512ba821b')
sha256sums_i686=('017475b8399d05ea6e2712a5234c38cc485e32a4aa5a36de34129ee5b2fd7906')
sha256sums_aarch64=('0df0a55cac5057c2746651e1630c625cc70c3261dc3a4864b285aeac8e6cf1e5')
sha256sums_armv7h=('cd81e6fb788cde1d9f0a4d92af2942871cf141793854c1df4279f7e127318b79')
sha256sums_armv6h=('1e40602d9495159b7848af19afafdaac1fbb1798b1695e85240fb9f0293f0686')
sha256sums_armv5tel=('7b77bb3ab15a724b1d341ece02dafa389ba60cc5ffa24683d32ac8866880e599')
sha256sums_mips=('3d762d0e05c55fd97401daca723b2472058e3cff1c5a1bd96f814a44694a3689')
sha256sums_mipsel=('8efbb7b2208f6668f2bd58429da00619e6073f0476f31b7b7df570f9dd81ffd8')
sha256sums_mips64=('1d9331896d5b38e0e26f9c6ac6fd6975699a3a85168c3e285c0dacc8aa48e4ab')
sha256sums_mips64el=('9a9ba0b4f0c6dd2f028b271ba3dabbf6c4f0787d7e2d2f2e6845f051b2dc262c')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
