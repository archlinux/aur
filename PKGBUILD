# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2025_10_15
pkgrel=1
pkgdesc="One zig to rule them all"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://github.com/marler8997/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-arm-linux.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86-linux.tar.gz")
source_powerpc64le=("${_pkgsrc}-powerpc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-powerpc64le-linux.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-riscv64-linux.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('f3be3ed086f47766a0c361876984a89e4f4c82496dfda6cb82ab8734619563fb'
            '491fef2e3fe35219d5bd74c3b0d166d323e279678fca49bb48200348d04c769d')
sha256sums_aarch64=('3bbd3c20d52c205f079026bf8770c54d0d8ea886b28f89af64e27dc5845cc09e')
sha256sums_armv7h=('ef33f7e30a0618c96dae432f8f03641aaac7da79a8c88661c5d7a1dfb3deefdd')
sha256sums_i686=('bd15517d15d0d875b0ed1aab71c5d10d79f35db069a9ef44f1b2b41aeedc1849')
sha256sums_powerpc64le=('bbbb91ed5571af90ee3260f51a34a6bd162ce4b0361620f390a46bfbfeda679c')
sha256sums_riscv64=('72390b2d6f58232a29840a9644b5c544bae30a8c49073ccc87b668c078dae4e7')
sha256sums_x86_64=('247c52d29682e8e78b93a8cdfdf1de29de75d8084061445af86fd5d7ce1d2b40')

package() {
  cd "${srcdir}"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
