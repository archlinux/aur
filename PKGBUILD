# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mapcidr"
pkgname="${_pkgname}-bin"
pkgver=1.1.34
pkgrel=1
pkgdesc="Utility program to perform multiple operations for a given subnet/CIDR ranges"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('f2bf5d5861482ea511b470014032ab6246ee0ba0cb2bf9b36bd7902bb4609427')
sha256sums_armv7h=('0d2ab735644042254d5a9a1ee5b46e0fbc99682f6415bf718399797ee1973142')
sha256sums_i686=('8991e860cc98c83fd926c8d55d961993ecdd66ea71eb55e14af88ec4c1bd5caa')
sha256sums_x86_64=('0d50011ee910ea8cd8d3edc7d5574de21e139e9901ce3b14ab1cb4b32677b7f0')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.MD"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
