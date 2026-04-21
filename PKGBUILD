# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="zlint"
pkgname="${_pkgname}-bin"
pkgver=0.8.1
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
            'a81bf938276a914da6413df0ef959bd889d3d5a66874f050e2a906ad63575e2e')
sha256sums_aarch64=('0e91b617fb938b952c7953d01d24bd1a67a2803a78949d224c5ba7e22604fac9')
sha256sums_x86_64=('e50df2d3b23843c9833fe532cf6da9a442f2c06890b3b6bf4afe6809be97ab22')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
