# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.13.0
pkgrel=1
pkgdesc="Command line artificial intelligence - Your local LLM context-feeder"

url="https://github.com/baalimago/${_pkgname}"
arch=('x86_64' 'i686' 'aarch64')
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
source_x86_64=("${_pkgsrc}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
source_i686=("${_pkgsrc}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386")
source_aarch64=("${_pkgsrc}-${arch[2]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
sha256sums=('bfca431f9ae5190d4f3745cfca4429b889c8f0b8b9932c5870374fa3f380a17d'
            '6cb47ef4eae7d65508d3107d09f96e96396749fc25060117dc783f5c3e0e18d3'
            '81abc6b6ae091984b5defa45e236462099a0f95afd211b5a39c7b70c8926decb'
            '824075343fe6b2f0bda7a627bec99f826e86571fee6c393812315f265d82a741'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('2c1a7012b78a52977ba5ab596c086c1aaaf2d05002971c2642dce3f43c10ee1b')
sha256sums_i686=('2ff1949eac6f349fd70abc4f97447b1aff581a4c5350b33cdaa2cc0a07bdffc6')
sha256sums_aarch64=('2c1a7012b78a52977ba5ab596c086c1aaaf2d05002971c2642dce3f43c10ee1b')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-EXAMPLES.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
  install -vDm644 "${_pkgsrc}-PROFILES-CODY.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-CODY.json"
  install -vDm644 "${_pkgsrc}-PROFILES-GOPHER.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-GOPHER.json"

  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

