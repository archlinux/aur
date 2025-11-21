# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.8.6
pkgrel=1
pkgdesc="Command line artificial intelligence - Multi-vendor generation in your terminal"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/baalimago/${_pkgname}"
license=('MIT')
depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-EXAMPLES.md::${url}/raw/refs/tags/v${pkgver}/EXAMPLES.md"
        "${_pkgsrc}-PROFILES-CODY.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/cody.json"
        "${_pkgsrc}-PROFILES-GOPHER.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/gopher.json"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
sha256sums=('feff9b277809e295031931300e4ecf38213abd78661a8fbd263ed131f2defe69'
            '666651e232585ef27d96bdef35a2f29aec6bc583a0e6cc82b47da18b962ce594'
            '81abc6b6ae091984b5defa45e236462099a0f95afd211b5a39c7b70c8926decb'
            '824075343fe6b2f0bda7a627bec99f826e86571fee6c393812315f265d82a741'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_aarch64=('57d6982d4193f5c68f5ffd6b18def2e5f5d7036d1645b075838904d9c1bf81b0')
sha256sums_i686=('54dd832fa9b47233c8b2a9dce6cbeeb87bb19b7edf8a4c61b839e46e02dddd40')
sha256sums_x86_64=('9b963d5142343699f5f3e157af114b7d0afdc61e22b53ee77b10e3650996afa4')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgsrc}-${CARCH}"    "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-EXAMPLES.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
  install -vDm644 "${_pkgsrc}-PROFILES-CODY.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-CODY.json"
  install -vDm644 "${_pkgsrc}-PROFILES-GOPHER.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-GOPHER.json"

  install -vDm644 "${_pkgsrc}-LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
