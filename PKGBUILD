_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.11.2"
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
# https://github.com/jeessy2/ddns-go/releases/download/v${pkgver}/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('8c96d7d0e9d99a306a8f80e807dc1fe472f3782b7b91e26e28c85d6c9c211faa')
sha256sums_i686=('330a25d8cef4adad93aa2c42779eb3705b88190436c901883892d885136773b0')
sha256sums_aarch64=('1481eea1a01167e4ef48e69b2a03e1dde22a00ec72909756082f78df11f0254b')
sha256sums_armv7h=('48e2becd46d1ba82f6e42821a5889b68bb6befe0271003770974d4bf9f75c9a9')
sha256sums_armv6h=('3639736ed3511dff03d6fe52ae4054413f6f8d1997059369ea20365c5992f158')
sha256sums_armv5tel=('4c32b349519818100a4a97ae4d200063729b1d2396cdb90b9ae770f303e2737a')
sha256sums_mips=('9b1c51058a4c653e9b97cb1a8294fefe31d486413e64a6d60f6dbcfebd5cf194')
sha256sums_mipsel=('cf57282bea02fa2a4de1486464d34e3b23d436538ea66156f9df16e796fb392a')
sha256sums_mips64=('c49b92cdd852c37db1287f79be522f7d6598c381159699477f8fb09473fe5123')
sha256sums_mips64el=('b5c97f00b5e17623667702dd08be87b8353a44cbcb7b5b2f75727d4042ae0ab7')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
