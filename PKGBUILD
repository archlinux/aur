# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gltfpack"
pkgname="${_pkgname}-bin"
pkgver=1.2
pkgrel=1
pkgdesc="Automatically optimize glTF files to reduce the download size and improve loading and rendering speed"
arch=(
  'x86_64'
)
url="https://meshoptimizer.org/gltf/"
_url="https://github.com/zeux/meshoptimizer"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
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
            'f03037ca7bad1e3eb7f4a63fa6084a8baabd5ba30d3c239a9a7f35705d873e26')
sha256sums_x86_64=('ebc236f5f6c08c7e5c5750476a187d24805d44d8c680449c4b7369c333f817b1')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
