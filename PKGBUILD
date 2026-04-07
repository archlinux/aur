pkgname=contextzip-bin
_pkgname=contextzip
pkgver=0.1.1
pkgrel=1
pkgdesc='Compresses noisy CLI output to reduce LLM context usage'
arch=('x86_64')
url='https://github.com/jee599/contextzip'
license=('MIT')
depends=()
optdepends=('jq: required for the Claude Code hook workflow')
provides=('contextzip')
conflicts=('contextzip')
options=('!strip')
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64"
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums_x86_64=('3421ba3fbbdcce98515628912e8bf1f4f4a4c2898c3cf009c4f4dd0624bee9a9'
                   'f805fcabe7842505f76d099d4192eb6d026a54b713f3363396dfa359fe63598c')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
