# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.7.2
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
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
sha256sums=('90fa1fb1edcc8c7928bcff25eafaf014c2ba8b67e7afd1fbfe311e758299a29d'
            '49521c29eb1889889064b16a4fce2e79abb54b520a1545000f22f71678d53046'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_aarch64=('35af1c1705aca203208f7bdb3e631db016ddc2896686147e96cd48788194ef40')
sha256sums_i686=('fbf01a342ca1bc02b049346a74fc0ea1ab92fae9fc946a71b5ce5ea68a421f00')
sha256sums_x86_64=('bdff65c8b4e845e1c853bc91320bec78be6a9057683f8623dd5782745b518870')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-EXAMPLES.md" "${pkgdir}/usr/share/doc/${_pkgname}/EXAMPLES.md"
  install -vDm644 "${_pkgsrc}-LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
