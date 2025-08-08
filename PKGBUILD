# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="swag"
pkgname="${_pkgname}-bin"
pkgver=1.16.6
pkgrel=1
pkgdesc="Automatically generate RESTful API documentation with Swagger 2.0 for Go"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/swaggo/${_pkgname}"
license=('MIT')
# depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/license")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_Linux_x86_64.tar.gz")
sha256sums=('59535ccc1a6d31b35298548ff67f13a60ef376897587bec1bbb1ca74d8d4d645'
            '6feeef4e2aca78ba9e5f7612fbe7517bde879bc31e6675225fba8aa6c95539cc')
sha256sums_aarch64=('0a2890b2ab31f37da92a45d27b4cc78501bb74720b1df0932d59377527c366e9')
sha256sums_i686=('66eeb5e5bc64293353bd9085dc91f951554ad0399af80e4c52e88b6ce62a84cc')
sha256sums_x86_64=('90bdf19e817001b17f5f91a1eefb2d2dd9631b88a85712f195f44b220848c8bb')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
