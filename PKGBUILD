# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2026_03_26
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
sha256sums=('f3be3ed086f47766a0c361876984a89e4f4c82496dfda6cb82ab8734619563fb'
            '491fef2e3fe35219d5bd74c3b0d166d323e279678fca49bb48200348d04c769d')
sha256sums_aarch64=('1963afb44ca0705768cba7346fc649b5b56879c5c6ab91303bc8808604ab3a3c')
sha256sums_armv7h=('6d68787bd9877e8621b42ed80e4518f5be0004c797675ceb4753767dd64e91de')
sha256sums_i686=('3a69a477b4640b3cdbb7f71526dce92cb81b286c2ad199720924773bd499c3ab')
sha256sums_powerpc64le=('d255b1d33a2375a7984b5df91720b765f0abc1398183701a30541fb214a13946')
sha256sums_riscv64=('2a97cab01553f1a92f95b2a3a3ea5ea0531ce6b8de4b6ed75b4e4b9d73887a01')
sha256sums_x86_64=('f9d5a09fbd7c019eecef1a397613ce5baec22872a1c3eb5ab4b1132e917c3d71')

package() {
  cd "${srcdir}"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
