# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gltfpack"
pkgname="${_pkgname}-bin"
pkgver=1.0
pkgrel=1
pkgdesc="Automatically optimize glTF files to reduce the download size and improve loading and rendering speed"
arch=(
  'x86_64'
)
_url="https://github.com/zeux/meshoptimizer"
url="${_url}/tree/master/gltf"
license=(
  'MIT'
)
depends=(
  'gcc-libs'
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/gltf/README.md"
  "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-ubuntu.zip"
)
sha256sums=('74b73b7eca8141cc60cef9b8f2674422c4eaae8a6dafd1c067a24272c27de05d'
            'e4a26033e3551fb2722888949fbb41e77aee628e8e8f04dcffeee301aa7e5634')
sha256sums_x86_64=('a0d116724a30003ab264dc60372f9de5e3cc55c46bb77088f1bb4b502e9c7fed')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
