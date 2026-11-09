# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="monocle"
pkgname="${_pkgname}-bin"
pkgver=1.6.1
pkgrel=1
pkgdesc="See through all BGP data with a monocle"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/bgpkit/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('0bea132446f415cc057d239964bc08a56a20e2de16f07dfe2f174256c7f13bb9'
            '2f7fe2af03db380114c5894a77181791be23b2cb12035669dfb38c09c47e104c')
sha256sums_aarch64=('2550086cdd2edb94fb6e6e4889995ab5ec615f106d135906eed957d54ca885c5')
sha256sums_x86_64=('f1ba30577af37b4865fc318898919df79c7db5a4d4a336ea8aa6623f12808e5e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
