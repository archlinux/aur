_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.12.5"
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
sha256sums_x86_64=('3a40c3e2d81cb454a357991ae305f06ed8dc463ed5d3324a9895e28072f60b8f')
sha256sums_i686=('2c4c2f124827e06bc03b010596d8fdcdfaed7ec3d451bac9c6e0f4e5d85c511a')
sha256sums_aarch64=('82e629ff7e10ed32bc3452d445f1da3ae0887415a36203f4657ca8b6021c41e3')
sha256sums_armv7h=('594c011ed873490d6c65989a91ab83aa734ac5aad0a2cd8aa14a9395e6cd5b17')
sha256sums_armv6h=('c607d2beaca937222a081057775c94b78b72cb8fa94aacdc60c5ac6fc193dd0f')
sha256sums_armv5tel=('05f3ca3b68b1c9617bc62d30ce6e0af6a0679277959feacf0e11fb35b935885e')
sha256sums_mips=('0384ff6a7e7f5d3362610c0c190cc21c75eb136703c05c94991d960749a4d791')
sha256sums_mipsel=('faa82c2d65dde7bf10532677db9f6c6dde57a7657cf151cc33898fd551f33df0')
sha256sums_mips64=('d3960be4e1757bf81d99d8f065d42c0fb0f949a0e3645f8917a0ffd1c501c740')
sha256sums_mips64el=('dd07d9db271301003337306dc58d9e95c89f765008508f0566554fef2b51e878')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
