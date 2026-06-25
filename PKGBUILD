# Maintainer: SunParis <132213306+SunParis@users.noreply.github.com>

pkgname=gitcommitgenerator-bin
_pkgname=gitcommitgenerator
pkgver=0.1.2
pkgrel=1
pkgdesc='AI-powered Git commit message generator with configurable OpenAI-compatible LLM support'
arch=('x86_64')
url='https://github.com/SunParis/GitCommitGenerator'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')
source_x86_64=(
  "${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  'a98fabf116d573ff51b4f503665cf794224449d3571d24e1ab5a73726ffff720'
  '92569023a813873f7067fb0f258325ec32da260b6e32e62179bc05eecaf85cef'
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
