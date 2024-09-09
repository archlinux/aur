# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.5.1
pkgrel=1
pkgdesc="Command line artificial intelligence - Multi-vendor generation in your terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/baalimago/${_pkgname}"
license=('MIT')
depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "EXAMPLES-${pkgver}.md::${url}/raw/v${pkgver}/EXAMPLES.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
sha256sums=('e02af76d3695b0a6ea2082879ebeb512d45ddc421e2cf20dc343f73adc2857a9'
            '49521c29eb1889889064b16a4fce2e79abb54b520a1545000f22f71678d53046'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('c4e004729a8a657cdc6fc44bf89b668d3316d9fa2337cdc71ea1ce2e1c8d4cae')
sha256sums_i686=('6bcbaab20aa19f653689d29dc9cf21cd5bc3a73fb89b4c0c6c106a9ae2c977e7')
sha256sums_aarch64=('07e05dfdf87385a38ec8a4ab32dab83530740d7f196339088090610f57aac3a8')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "EXAMPLES-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/EXAMPLES.md"
  install -Dm644 "LICENSE-${pkgver}"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
