# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gltfpack"
pkgname="${_pkgname}-bin"
pkgver=0.22
pkgrel=2
pkgdesc="Automatically optimize glTF files to reduce the download size and improve loading and rendering speed"
arch=('x86_64')
url="https://github.com/zeux/meshoptimizer"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/gltf/README.md"
        "LICENSE-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-ubuntu.zip")
sha256sums=('2f389fcbdee3f8ccdc413de9e93f0fb9d06316dae6430c6e4a6a134ef706cf35'
            'd1bc307ff896c7fc65e3ff4823cc478194f7a5bc6436f99534ebede4d9e2017a')
sha256sums_x86_64=('9ecc0a0a2a66308b6720611cc4e5c36bfebb0eebb663415983c410771e2187e7')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
