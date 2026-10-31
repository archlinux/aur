# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=xmtr
pkgname=${_pkgname}-bin
pkgver="0.3.4"
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

sha256sums_x86_64=('884e8512bb38ac44ad5879be89bddf91b27cef23ccad693a89ef8b0c5ced2881')
sha256sums_i686=('e46d0686487a975fe331c5f402c2f76f61a6d7671057e38cae332ee01c4de7c0')
sha256sums_aarch64=('89f0af8d23dbc059a68b40ba5f65632cd50ed2e174035d74999190ff58b06445')
sha256sums_armv7h=('d7e75fd77869b1b9e66cbd68b2b769c0920dd7d4868d5201e2a8522a7a90599b')
sha256sums_armv6h=('7c07ec062ad009597bf422334a40394e85ec3a306ca97af8f17d8d8d11631711')
sha256sums_riscv64=('3464783531d9d22aee8aa6964e6303cd308f766346823a447b18636ff7033433')
sha256sums_ppc64le=('437783e024ae06a8bc69c040e7fda509e76158a3808c494ec13e7d93d507c8b6')
sha256sums_ppc64=('6c8af90f918e4181c3260e31fd4fb1b101aefb6a7b1c401c7463fc161b918ae4')
sha256sums_s390x=('6a0675b87a31b121d161bf062fc4d2ac9eb910e6bde94396efdb391f03b99808')
sha256sums_sparc64=('ea84f5ef478690b2cf41c72a071318c8452d0f75d8c77e228aa3253d9468cc28')
sha256sums_loongarch64=('f4c8e97199a0a840557a2172a13ed963a5ced66660ddb82d97bfd1f83d59bdbb')

package() {
    install -Dm0755 "${srcdir}/xmtr" "${pkgdir}/usr/bin/xmtr"
    install -Dm0644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm0644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm0644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    setcap cap_net_raw+ep "${pkgdir}/usr/bin/xmtr"
}
