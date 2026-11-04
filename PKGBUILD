# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=xmtr
pkgname=${_pkgname}-bin
pkgver="0.3.6"
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

sha256sums_x86_64=('d8d2cf97b3e3e4f46e6915dd500cb6c217ad2e22292eea6af9eea18a5f311d4b')
sha256sums_i686=('52072ea104de77a935f5f50880392bab11e41a45857b56b9c36cc7a92ed4aaaf')
sha256sums_aarch64=('320e109a93392ee26a17252c39dcbe572d9540d1870a65e949f044f349a0c4d3')
sha256sums_armv7h=('f0c5e58554fe769770be8e0b4c3834544e4f1d3bc04d2b54ac13a5ee0eaab609')
sha256sums_armv6h=('d148d60e6f76db27e2aef006ff0a2808e8d30d4c5e0733c163b3dbc217e28a4a')
sha256sums_riscv64=('60dbc03364e0915abbc0fdc0a30c8af7e047c6a997ad1275e489e6962c2f81e9')
sha256sums_ppc64le=('292c97317ba8e143efcffb561ec4153f4797303390102da4d677cfc02b1aba4e')
sha256sums_ppc64=('32e1d56c2e37d21ff9f4847852042dd7f3d741e5aa90ada584d5be53aa1819c1')
sha256sums_s390x=('6121022d7028a2e50b15eb9fb39f4cd811797f07110058bd36bfc20f16771070')
sha256sums_sparc64=('e8df22e0a4573c47b0770554caeaea8f79e97538a09f3e75963569bac99a790a')
sha256sums_loongarch64=('4418689a093a39ef848a4bf52f796d94be8b002a3a4a677d466cc05eb47dd96f')

package() {
    install -Dm0755 "${srcdir}/xmtr" "${pkgdir}/usr/bin/xmtr"
    install -Dm0644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm0644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm0644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    setcap cap_net_raw+ep "${pkgdir}/usr/bin/xmtr"
}
