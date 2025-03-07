_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.9.0"
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
sha256sums_x86_64=('052d7e345e2a5eecd1af770c8182e965272c24140a01160e922608e78152a7d5')
sha256sums_i686=('afa95c3f2eee12bb6a80a5a0ca8126a1d1ca0bfb590821736c7fa7b6a3ce77f0')
sha256sums_aarch64=('642fd7765630747e2b46cbe05fa77e282242a390c4c758c659b3b761754b05e4')
sha256sums_armv7h=('574f2fb8f3722b03ec53e807185ba572f5f46e579a5351964a0ede76039b2f73')
sha256sums_armv6h=('cc1a72a3358f58675454da1af790d74e6acef249dde78cf8b3b05e276a9890e8')
sha256sums_armv5tel=('9dcbcf75705ddfa4fe978353c81f852c835b57d5e4cc058e50787861f4a4d125')
sha256sums_mips=('81da515a72c212801638d8c68fd64442dd06fed027f22a9d3433c620b0f9801c')
sha256sums_mipsel=('4a0108ef8d91bec4375e648d172bd17c000126d46b4b693ff459790d8a3d65c2')
sha256sums_mips64=('e046896f8a1e8dd8d94654d0c917b34735508313d998bcb9191903a89fbe7dac')
sha256sums_mips64el=('0284ea2267b7145ead32b3272b0f58ef52b11518e0b12da314061eb502fba2dc')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
