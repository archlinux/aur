# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scafetch"
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="Display information about your remote Git repositories in an aesthetic and visually pleasing way"
arch=('x86_64')
url="https://github.com/iddev5/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux")
sha256sums=('8d52e0134bbb747a017edce9e8dc8ac1a97ffcdd7bc85f2d2b94d3ddce29be70'
            '290cdd78c756b34221c687866b0d54541b376d3765ffaa8ffa31a0540edff5a9')
sha256sums_x86_64=('4433b9968937ba3a0ed1ffe1b6a8eaf01a73b3064b21854f44b8ae3f869a0aa7')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
