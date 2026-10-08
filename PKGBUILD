# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.11.3
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
sha256sums=('ee1ccff2999523d7685676ca5f98ed4e622d04fc35fad922b1d20026d71795c7'
            '9b18c3e1ab30ef4fc49a2650f2225c089a8285620e50ff44447b9a6f577842d5'
            '81abc6b6ae091984b5defa45e236462099a0f95afd211b5a39c7b70c8926decb'
            '824075343fe6b2f0bda7a627bec99f826e86571fee6c393812315f265d82a741'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('ea5bd161036af51d591b619687ee27e7511d37fa795a4a807fa1852d2d4c0222')
sha256sums_i686=('f489b5bad66343506d57f58327f34942d6000063638248c96067de517098860a')
sha256sums_aarch64=('ea5bd161036af51d591b619687ee27e7511d37fa795a4a807fa1852d2d4c0222')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-EXAMPLES.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
  install -vDm644 "${_pkgsrc}-PROFILES-CODY.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-CODY.json"
  install -vDm644 "${_pkgsrc}-PROFILES-GOPHER.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-GOPHER.json"

  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

