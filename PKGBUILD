# Maintainer: Alan Placidina Maria <placidina[at]protonmail[dot]com>

_pkgname=amass
pkgname=${_pkgname}-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('x86_64')
url="https://github.com/OWASP/Amass"
license=('Apache')
conflicts=('amass')
source=(https://github.com/OWASP/Amass/releases/download/v${pkgver}/${_pkgname}_Linux_amd64.zip)
sha512sums=('45fa444a9186362d30f1abe8502fa4875c50521a6f7019d4453649f3ca9a800b5e04184ee777ad1e86dd1f12847dddf666b7c575c6563e5bf12ded598973f504')

package() {
  cd "${_pkgname}_Linux_amd64"

  install -dm 755 "${pkgdir}/usr/share/${_pkgname}"
  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  cp -a --no-preserve=ownership "examples/" "${pkgdir}/usr/share/${_pkgname}"
  find "${pkgdir}/usr/share/${_pkgname}/examples" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${_pkgname}/examples" -type f -exec chmod 644 {} \;
}
