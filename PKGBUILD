# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=xmtr
pkgname=${_pkgname}-bin
pkgver="0.4.2"
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

sha256sums_x86_64=('9d5ecadc51b8b94eb93debac761ba20c8b688c4ceb2e5a91780781f600ec787c')
sha256sums_i686=('6b168d675b8f78e4864e13603a71ae0503f3e1853e88d00362d68a47994c5fd8')
sha256sums_aarch64=('2b38184c6a70bc262f2c5575d610309dc6968ec266619848f8a25402b02e8628')
sha256sums_armv7h=('e2617e737dc9b9fa19ebd51ebae082507ec52429baf928e16203f22e7dd3a8d4')
sha256sums_armv6h=('89efc25b9182235f53d4568e335461d794c541fce55bc72dad930b42d7987bb9')
sha256sums_riscv64=('a15349e68f26ee4f901b54d8e18502a40b462f59b609b20d022ed6f34880a487')
sha256sums_ppc64le=('f0c4377c13a40994bf599606335ccbc576d29b234e551e13b0b92c42a699c828')
sha256sums_ppc64=('02d825e6e8c8c0f9848932b8a99cc0adf0a1511483be4f8bea1fcba901c020ae')
sha256sums_s390x=('a3d30cd604c95423297bf09c4469216d798c61f92f13a25f7ac64467222f3f26')
sha256sums_sparc64=('d6b465f521fb4a7fb6aa17fc59884d8d25ffaded59cae0da3da36db3a239ae5a')
sha256sums_loongarch64=('02448fa4585a01d8b1ad2df281d413417c7a9a8d31ff7c342124c67e4fb9e53a')

package() {
    install -Dm0755 "${srcdir}/xmtr" "${pkgdir}/usr/bin/xmtr"
    install -Dm0644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm0644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm0644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    setcap cap_net_raw+ep "${pkgdir}/usr/bin/xmtr"
}
