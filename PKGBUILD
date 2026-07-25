# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.10.17
pkgrel=1
pkgdesc="Command line artificial intelligence - Your local LLM context-feeder"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/baalimago/${_pkgname}"
license=('MIT')
depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-EXAMPLES.md::${url}/raw/refs/tags/v${pkgver}/examples.md"
        "${_pkgsrc}-PROFILES-CODY.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/cody.json"
        "${_pkgsrc}-PROFILES-GOPHER.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/gopher.json"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
sha256sums=('a5590e0ca824c602c888eb60cde658c8893aba2dd7b61716d404bc556928fe41'
            '0292111b2a0e3f68351506ce475f6b039f8df8823f37f129dd07efa3f64bdc37'
            '81abc6b6ae091984b5defa45e236462099a0f95afd211b5a39c7b70c8926decb'
            '824075343fe6b2f0bda7a627bec99f826e86571fee6c393812315f265d82a741'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_aarch64=('31b4ee3ae9744cab86d2ebb7d373f9a419fe3e5c6574f5819d688e5d8a62ff68')
sha256sums_i686=('32c970b47d9af3b88f3fcb28999882fad5e889ff686346e4969b515978f5a39a')
sha256sums_x86_64=('0ea955c1aadeea3a3f0acde379310f66a3ba0b30cd8b432bc8bef3ca9f4ef107')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgsrc}-${CARCH}"    "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-EXAMPLES.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
  install -vDm644 "${_pkgsrc}-PROFILES-CODY.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-CODY.json"
  install -vDm644 "${_pkgsrc}-PROFILES-GOPHER.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-GOPHER.json"

  install -vDm644 "${_pkgsrc}-LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

