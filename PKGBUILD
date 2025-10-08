# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mapcidr"
pkgname="${_pkgname}-bin"
pkgver=1.1.96
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
sha256sums_aarch64=('81fcff676f2cbcdac788e5a3d8c3b8992fabe1914a528c5d3aea3cbafeba64f8')
sha256sums_armv7h=('4723b4283d0efc2cc223e066f7cad13be78441cbe53a9b7391237ecc372fc9d3')
sha256sums_i686=('21fc1fce302312753cf9598643bc12fc9f028e22207c78dd07f069ec6aaf4b7d')
sha256sums_x86_64=('3118f4ab5c1863881982117746c5140642335b80d03540143182881b1f175267')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.MD"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
