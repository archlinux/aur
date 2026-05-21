# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-mcp-core-server"
pkgname="${_pkgname}-bin"
pkgver=0.9.2
pkgrel=1
pkgdesc="Run MATLAB® using AI applications with the official MATLAB MCP Server from MathWorks®"
arch=(
  'x86_64' # glnxa64
)
url="https://www.mathworks.com/products/matlab-mcp-core-server.html"
_url="https://github.com/matlab/${_pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'matlab-release>=R2020b'
  'sh'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgname}.sh"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-glnxa64"
)
sha256sums=('49d0f8ed16c0828abccb82839263013eb86b664340f46352021f9374574143e7'
            'aac20beb4a6d957e64fe9b1bc017dafd115b18fc4579f5e59554728f48953557'
            '2cb440d3a47c8ea1ea975d7b15175b87ec31173ab671d073112520d065ec4625')
sha256sums_x86_64=('333c5328b559e0a463d7d6d005f653a7cba99e67e056c0a9b6150e5c5251d6b3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"        "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
