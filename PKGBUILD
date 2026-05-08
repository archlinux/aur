# Maintainer: pngdeity <pngdeity@tutanota.com>

_pkgname=amass
pkgname=${_pkgname}-bin
pkgver=5.1.1
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('x86_64')
url="https://github.com/owasp-amass/amass"
_githubname="owasp-amass/amass"
license=('Apache-2.0')
conflicts=('amass')
source=("https://github.com/owasp-amass/amass/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
sha512sums=('6e7289beaf0809e4795f9715de0bd739a41a89493a27b8134c9696f620eff8bca355c92bd83207244da1763f52b4b97e9d4f4201ece357bdaf45cad48c26c8ed')

package() {
  cd "${_pkgname}_linux_amd64"

  install -dm 755 "${pkgdir}/usr/share/${_pkgname}"
  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  cp -a --no-preserve=ownership "resources/" "${pkgdir}/usr/share/${_pkgname}"
  find "${pkgdir}/usr/share/${_pkgname}/resources" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${_pkgname}/resources" -type f -exec chmod 644 {} \;
}
