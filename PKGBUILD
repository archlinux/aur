# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Alex Colburn <alcolbur@nmu.edu>

pkgname=eclipse-java-bin
_pkgname="${pkgname%-java-bin}"
pkgver=4.20
_releasemonth="2021-06"
pkgrel=1
pkgdesc="Highly extensible IDE"
arch=('x86_64')
url="https://www.${_pkgname}.org/"
license=('EPL')
depends=('java-environment>=11'
	 'libsecret'
	 'python')
provides=('eclipse-java')
conflicts=('eclipse-java')
source=("${pkgname}-${pkgver}.tar.gz::https://www.${_pkgname}.org/downloads/download.php?file=/technology/epp/downloads/release/${_releasemonth}/R/${pkgname%-bin}-${_releasemonth}-R-linux-gtk-${CARCH}.tar.gz&r=1"
	"${_pkgname}.desktop"
	"${_pkgname}.png")
sha256sums=('3a2355fa605019920a9c35eb0770d8fb9c5fd123069bc05149a847b1965a9b2b'
            '4f98016c9e66066fd6e70e9103860bf92800097ea93e7525916ed20061c7dbff'
            '6321b708362bfee07386753d83a13ad1f4a087332cdcdf0f77c003e29bdd0a2b')

package() {
  install -d "${pkgdir}/opt"
  cp -r "${_pkgname}" "${pkgdir}/opt/"
  install -d "${pkgdir}/usr/bin"
  ln -sv "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm0644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm0644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
