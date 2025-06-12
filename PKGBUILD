# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gltfpack"
pkgname="${_pkgname}-bin"
pkgver=0.24
pkgrel=1
pkgdesc="Automatically optimize glTF files to reduce the download size and improve loading and rendering speed"
arch=('x86_64')
url="https://github.com/zeux/meshoptimizer/tree/master/gltf"
_url="https://github.com/zeux/meshoptimizer"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/gltf/README.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-ubuntu.zip")
sha256sums=('d2ea1950d6d574ca60e0847b660509ee44f2c00175aeda11cdb4467e80a96b33'
            'e4a26033e3551fb2722888949fbb41e77aee628e8e8f04dcffeee301aa7e5634')
sha256sums_x86_64=('4a8a1724706380738ca3e026f106849b8f891ffa725a73f9c9d184d3db68de37')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
