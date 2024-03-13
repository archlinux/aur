# Maintainer: Alan Placidina Maria <placidina[at]protonmail[dot]com>

_pkgname=amass
pkgname=${_pkgname}-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('x86_64')
url="https://github.com/OWASP/Amass"
license=('Apache')
conflicts=('amass')
source=(https://github.com/OWASP/Amass/releases/download/v${pkgver}/${_pkgname}_Linux_amd64.zip)
sha512sums=('a128655326550c984077fb23de84cc5af7b7dbd5763e7e278b6e76dc2a4d60401814bf8cd28183afe898472cd8cc62aa68950c12002083345e3898ec1929c40a')

package() {
  cd "${_pkgname}_Linux_amd64"

  install -dm 755 "${pkgdir}/usr/share/${_pkgname}"
  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  cp -a --no-preserve=ownership "examples/" "${pkgdir}/usr/share/${_pkgname}"
  find "${pkgdir}/usr/share/${_pkgname}/examples" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${_pkgname}/examples" -type f -exec chmod 644 {} \;
}
