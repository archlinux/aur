# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-mcp-core-server"
pkgname="${_pkgname}-bin"
pkgver=0.9.1
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
            '2d00916adf66600f8f1df4715cc89e8bbca8e9a64b397113bfab1ae3ec023124')
sha256sums_x86_64=('5d2c4915c097d5b8d99d5867d124b3f2135cb69c851997f5d2acada8827a38ec')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"        "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
