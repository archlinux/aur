# Maintainer: SunParis <132213306+SunParis@users.noreply.github.com>

pkgname=gitcommitgenerator-bin
_pkgname=gitcommitgenerator
pkgver=0.1.0
pkgrel=1
pkgdesc='AI-powered Git commit message generator with configurable OpenAI-compatible LLM support'
arch=('x86_64')
url='https://github.com/SunParis/GitCommitGenerator'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')
source_x86_64=("${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('087ca325d15d2125e338d0cb60fcfb0c5bed3fa44b1a42e9fc870abf4ca136fd')

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
