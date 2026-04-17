pkgname=contextzip-bin
_pkgname=contextzip
pkgver=0.2.0
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
sha256sums_x86_64=('d3269e26b01efe999b446a3156585125e99b668ab6065f699a38ca1c8f5f95c8'
                   '7611c014d0a0049bcb60ab734ac35f4c1cd6ec409a52ed3bb74acf3629533858')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
