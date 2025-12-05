# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="safecloset"
pkgname="${_pkgname}-bin"
pkgver=1.4.2
pkgrel=1
pkgdesc="Cross-platform Secure TUI Secret Locker"
arch=('x86_64')
url="https://dystroy.org/safecloset/"
_url="https://github.com/Canop/${_pkgname}"
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}.zip")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('bcb0847dfcff46d71786a9e5a0022791bdae66b4635000b9e0a1f273ffbc486a')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${CARCH}-linux"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
