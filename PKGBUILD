# Maintainer: Alan Placidina Maria <placidina[at]protonmail[dot]com>

_pkgname=amass
pkgname=${_pkgname}-bin
pkgver=3.20.0
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('x86_64')
url="https://github.com/OWASP/Amass"
license=('Apache')
conflicts=('amass')
source=(https://github.com/OWASP/Amass/releases/download/v${pkgver}/${_pkgname}_linux_amd64.zip)
sha512sums=('fffd310a5077be4d02ebfa3092a139b31b8b665cd0359af90f3ed9ff242ac3567eab7c82e965201974c8a6ba8b4c82e43a34e66f7c5e68d11d11d174573b1e97')

package() {
  cd "${_pkgname}_linux_amd64"

  install -dm 755 "${pkgdir}/usr/share/${_pkgname}"
  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  cp -a --no-preserve=ownership "examples/" "${pkgdir}/usr/share/${_pkgname}"
  find "${pkgdir}/usr/share/${_pkgname}/examples" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${_pkgname}/examples" -type f -exec chmod 644 {} \;
}
