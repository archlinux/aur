_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.12.2"
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
sha256sums_x86_64=('9ce8980e6e1595c21534da2b610822ed27164cec279d0eadfb8020112a4c555e')
sha256sums_i686=('0329231eb027c3b5bea09ad4adbcca371cb2cc7334fd90648add35c9786535f8')
sha256sums_aarch64=('99ddeafc78444b23af4c96a126c0725a39f618a4dac25e074c44762c14d999ea')
sha256sums_armv7h=('74d4bf5aee29f601fd9274a8468d117b9a722ca22dc0861776223072d533350a')
sha256sums_armv6h=('9d9f4bff15243c801b6ca33ff81ba3c8c0fa0e6891719af3769c9587ba4e94c9')
sha256sums_armv5tel=('469eb114e217fa437e786e6c9a1215c140fc921c394fb2087fb6bb66dd76958b')
sha256sums_mips=('ec22421a80ad9629927a60f71060b602de56f7a2fe27e66d815d0bfd30deb89c')
sha256sums_mipsel=('28d4e7e12051320a7ce87af8f35b593f97982ea9ede54071943348a88a08869e')
sha256sums_mips64=('467cf1e6da73859bb8c3731bafd50f9ae9115fe97ebf1c3ce6435b2b7a3faee7')
sha256sums_mips64el=('2c59437806d276470a0cde0db37ce9c2f4bda3fad5c6baaefd73f231a4251076')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
