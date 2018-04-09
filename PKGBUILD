# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=java-design-patterns
pkgver=1.16.0
pkgrel=1
pkgdesc="Design patterns implemented in Java"
arch=("any")
url="http://java-design-patterns.com/"
license=("MIT")
optdepends=("java-environment" "maven")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iluwatar/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("00c6d4a6358686f82fb475df19b85b2eff4a00364cf6fb199f8c6d52a22178e8")

package() {
  msg2 "Installing custom license /usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  msg2 "Installing ${pkgname} into /opt"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
