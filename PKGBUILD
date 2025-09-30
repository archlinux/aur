# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mapcidr"
pkgname="${_pkgname}-bin"
pkgver=1.1.95
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
sha256sums_aarch64=('d98a25cf301e429aa42f37980a27e9c9f4a7014b08916fe05320046ddd0b0068')
sha256sums_armv7h=('c10c883cc70a60bbaf45877aba9e73535fdb0832f42e28f9fa67aa365fa003d8')
sha256sums_i686=('5e18ea8165b332866a0de3486830b206a6178ea103a1818af8ba0fc464a5e576')
sha256sums_x86_64=('c9288cb9cb784fae6ea59f9912ed3176e22764df9c91276d1853206c3f233d11')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.MD"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
