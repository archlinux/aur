# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=xmtr
pkgname=${_pkgname}-bin
pkgver="0.4.3"
pkgrel="1"
pkgdesc="Concurrent traceroute built on trippy that publishes routes, trace several targets at once and see every hop on a map."
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv7h"
    "armv6h"
    "riscv64"
    "ppc64le"
    "ppc64"
    "s390x"
    "sparc64"
    "loongarch64"
)
url="https://github.com/Alice39s/xmtr"
license=('Apache-2.0' 'MIT')
depends=('glibc')
makedepends=('libcap')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-armv7-unknown-linux-gnueabihf.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-arm-unknown-linux-gnueabihf.tar.gz")
source_riscv64=("${_pkgname}-${pkgver}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-riscv64gc-unknown-linux-gnu.tar.gz")
source_ppc64le=("${_pkgname}-${pkgver}-ppc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-powerpc64le-unknown-linux-gnu.tar.gz")
source_ppc64=("${_pkgname}-${pkgver}-ppc64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-powerpc64-unknown-linux-gnu.tar.gz")
source_s390x=("${_pkgname}-${pkgver}-s390x.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-s390x-unknown-linux-gnu.tar.gz")
source_sparc64=("${_pkgname}-${pkgver}-sparc64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-sparc64-unknown-linux-gnu.tar.gz")
source_loongarch64=("${_pkgname}-${pkgver}-loongarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-loongarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('325efbd36e78e7c38e448446ba67a4c1976a9e2afb016495d56b1b4e7bf22bfa')
sha256sums_i686=('3d314ccf7d11a6b504dea3dd4358b9137aac9ebd5a983b3c20cc866e99fcea65')
sha256sums_aarch64=('0fdd01cdd887d6907dbe58c2fb2999279cdf806b0bb781b0b7fded51396da9e4')
sha256sums_armv7h=('504a945eb5d96a73ef3a532682dd532760f1878fcbfe9349b1a494dd77306a73')
sha256sums_armv6h=('134d4c7ac05818c83c1b79f12b047a8ae2ccaf04895458f6a353854905a45acc')
sha256sums_riscv64=('6e74e3f4796b9af115299240a59c4b6d7c5e3d5b4ecb12a6dc402522594d9a55')
sha256sums_ppc64le=('edbf19630d9f55c29c2243360c36b869393b0a6269258e97ea729507fa293ecc')
sha256sums_ppc64=('93ff0533cf1923017987184b24339f092f350e2a1f32c42d09dbab3208afc63d')
sha256sums_s390x=('41b984bd46ad607ae544fd8858caa34c2cab2180d31eda4861d4988af5a7c4d8')
sha256sums_sparc64=('c32ecee223307480220657ed544bde66d84fcd8f3d1ef3babbca12b204451610')
sha256sums_loongarch64=('344a0abc7f6c17c1d6bbd5f60661acc22b432c92fc6d6172ddece452e86ddf0a')

package() {
    install -Dm0755 "${srcdir}/xmtr" "${pkgdir}/usr/bin/xmtr"
    install -Dm0644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm0644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm0644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    setcap cap_net_raw+ep "${pkgdir}/usr/bin/xmtr"
}
