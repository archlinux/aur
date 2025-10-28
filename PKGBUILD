# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mapcidr"
pkgname="${_pkgname}-bin"
pkgver=1.1.97
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
sha256sums_aarch64=('88e4468f8bdaacbeeb7d43d1b5dffba9127f63763ba55c6280df990a010b88a7')
sha256sums_armv7h=('201050289d552c67ff1c6bf0eb3bbe2cf7514b10083b59be9f6187f9ded75656')
sha256sums_i686=('d182862a35fbdc21472ec83dd9e419d0c3a31b1e10029a1ed02b8b35212499a8')
sha256sums_x86_64=('d31b95e6bf303d4e44104819523119487be2a4973d6bdc52c3f18f26518e72c4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.MD"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
