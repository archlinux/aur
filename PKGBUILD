# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-mcp-core-server"
pkgname="${_pkgname}-bin"
pkgver=0.8.1
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
            'd53c8e173905b30368952223bf2f76d25522cbb929b0f1a3b6c663a8dfe9badd'
            'ad58146f20a6c31a5147a1e0f6a726ee039c9bb3dc89a4b4752c0b7416defcb7')
sha256sums_x86_64=('1323ef5c2c11689933e9de97aed07fab763e740f15ed21cd9e015759c775de81')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"        "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
