# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gltfpack"
pkgname="${_pkgname}-bin"
pkgver=0.25
pkgrel=1
pkgdesc="Automatically optimize glTF files to reduce the download size and improve loading and rendering speed"
arch=('x86_64')
_url="https://github.com/zeux/meshoptimizer"
url="${_url}/tree/master/gltf"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/gltf/README.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-ubuntu.zip")
sha256sums=('47eede73816a1754b48f8f394186a0e7de9ab8b706a0cf2ad58fb35786af879f'
            'e4a26033e3551fb2722888949fbb41e77aee628e8e8f04dcffeee301aa7e5634')
sha256sums_x86_64=('78fe884c216cf14434b11d932940891e891b9fa021082e4eeb6460e633d90d12')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
