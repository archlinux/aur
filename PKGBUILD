# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=xmtr
pkgname=${_pkgname}-bin
pkgver="0.3.1"
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

sha256sums_x86_64=('fc55337738e3951f91ece02eba18d75e271e03e75005d5ac06c8fc632c00a4e3')
sha256sums_i686=('fed9df1cea640fc6dde75fc389b40eebb5f5d167af278d822f0c49381ab3a6ee')
sha256sums_aarch64=('795453ec1dc1bdbe9cac60a9aeafd41a9a78911498abe7a4de4f00d3ea28761c')
sha256sums_armv7h=('40d3560ebc79e72312d3af3d9c968dd44001bfe231887ac30258edc942bb9187')
sha256sums_armv6h=('c7fd4ace0869ad716e814bc8207be67d5772581835797138a408da0c552dafc2')
sha256sums_riscv64=('d635a150dedb1795d9131dd3551607eea200af3e1c1287f44e1d7b61396abef8')
sha256sums_ppc64le=('235ad1da11da8dff626c15b26fc099905c574da1d76aabdbfac12835c4d3494f')
sha256sums_ppc64=('f5fa785a7fb78592eabed3514b634516c8bde320cab25924c53ab7e9545ae38d')
sha256sums_s390x=('d765fe9a531f98713128d734ae0d0954e570de2443a44626e009ae8fe96bfe45')
sha256sums_sparc64=('8132f38f24eca55d5684ca72cd2aed3be86e49b99a8227f61d353a9aca8877e6')
sha256sums_loongarch64=('05c1847713d66846e72e2f4308cff927d3a568ba58a4162500bdf7162fd773f9')

package() {
    install -Dm0755 "${srcdir}/xmtr" "${pkgdir}/usr/bin/xmtr"
    install -Dm0644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm0644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm0644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    setcap cap_net_raw+ep "${pkgdir}/usr/bin/xmtr"
}
