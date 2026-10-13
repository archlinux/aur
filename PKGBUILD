# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2026_10_13
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
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz"
)
source_armv7h=(
  "${_pkgsrc}-arm-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-arm-linux.tar.gz"
)
source_i686=(
  "${_pkgsrc}-x86-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86-linux.tar.gz"
)
source_powerpc64le=(
  "${_pkgsrc}-powerpc64le-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-powerpc64le-linux.tar.gz"
)
source_riscv64=(
  "${_pkgsrc}-riscv64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-riscv64-linux.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz"
)
sha256sums=('ec608e2018c5daba1f6249241be4def945fbd7d367daf5cb0ba812a64e5fdf3e'
            '491fef2e3fe35219d5bd74c3b0d166d323e279678fca49bb48200348d04c769d')
sha256sums_aarch64=('72f90cc760169c7a958372f56866773b9cca23ae7938f12f740f042bb1264f20')
sha256sums_armv7h=('c2aaf9a6de22a16400ea3c5bb62acbbadd081b503f43a890632b20eb1da63052')
sha256sums_i686=('a2ec80e04fb46ef06f6548a629a4fbc662d2a5c473403b6fab090e5eba0a4fd4')
sha256sums_powerpc64le=('692352d536ad76864e48ed229bea4d8c1c14a9c387873a262abdcbf83275ec4b')
sha256sums_riscv64=('31f03358d969b4039d780979ee6d63199ae251b484ced93326ed05a61210f6ed')
sha256sums_x86_64=('e4742a7ce7835828efb93d2cfa3c9d07fead33755a8bb7185d2159fda872018e')

package() {
  cd "${srcdir}"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
