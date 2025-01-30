# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.6.2
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
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "EXAMPLES-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/EXAMPLES.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
sha256sums=('d150e02fc32e6270ae0ad7e1f0ae91e51b337eec6165893737cdd701497ef59e'
            '49521c29eb1889889064b16a4fce2e79abb54b520a1545000f22f71678d53046'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_aarch64=('16fe59c5bdf9479848a324fb1a1a21db92143fcab2ded775c76f558647301a0f')
sha256sums_i686=('9f92f3b5b328b92c597e1d2cb8c1fe98c106bfb93b5b5dac95e57d71b43c6a94')
sha256sums_x86_64=('46d73534cfb6491b3681cb2feb6ab5f81bae0c466a12e8f19f8914025efe5a41')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "EXAMPLES-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/EXAMPLES.md"
  install -vDm644 "LICENSE-${pkgver}"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
