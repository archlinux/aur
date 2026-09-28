# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="zlint"
pkgname="${_pkgname}-bin"
pkgver=0.10.0
pkgrel=1
pkgdesc="A linter for the Zig programming language"
arch=(
  'aarch64'
  'x86_64'
)
url="https://donisaac.github.io/zlint/"
_url="https://github.com/DonIsaac/${_pkgname}"
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
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64"
)
sha256sums=('2477ab33e461d9a85f7d3ff54488807bd539d1b01b553788cded68d1880aa281'
            '632618f23793f841fa42139db6ec88477c441776727b0ff4f4edee263e4a43fc')
sha256sums_aarch64=('ec5e31eacc889540dbfa0a32f0e694199d06c16f640b832bf2a3bd8ecc07c3e3')
sha256sums_x86_64=('0b331646d5e40bec3cfcb0694c5da0b13b9de8b10af12937a777ab3144b70b65')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
