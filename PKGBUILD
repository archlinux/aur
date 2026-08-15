# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="zlint"
pkgname="${_pkgname}-bin"
pkgver=0.9.1
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
sha256sums_aarch64=('4d8a55ca5267fbd9cec46e09def320c1c30e5322e28707a3b15ff05cbf244673')
sha256sums_x86_64=('3290bd511d37e4f6ccca3621b9894cd6c378195cdaac27520d0bd894058b2b9b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
