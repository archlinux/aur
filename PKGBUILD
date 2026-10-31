# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="agentic-toolkit-installer"
pkgname="matlab-${_basename}"
pkgver=0.3.0
pkgrel=1
pkgdesc="A unified installer for the MATLAB MCP Server, MATLAB Agentic Toolkit and Simulink Agentic Toolkit"
arch=(
  'x86_64' # x64
)
url="https://github.com/matlab/${_basename}"
license=(
  'custom'
)
depends=(
  'matlab-release>=R2021a'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.md::${url}/raw/refs/tags/v${pkgver}/LICENSE.md"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_basename}-linux-x64"
)
sha256sums=('91c39591e1f54c8da7dcd8b6ce2bbafa33993c831843600292c5e8a8671c91af'
            '2eb513144e31cccd8a8130086d306cefeeb8cd8764246fb81b254a14ac337e99')
sha256sums_x86_64=('521ab57d587273f6616f62aee679dcc3b8b16d23252193d98cb608c2f4fb1cd5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
