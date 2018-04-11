# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=java-design-patterns
pkgver=1.19.0
pkgrel=1
pkgdesc="Design patterns implemented in Java"
arch=("any")
url="http://${pkgname}.com/"
license=("MIT")
optdepends=("java-environment" "maven")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iluwatar/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("9e5a7f85c19845491527045797c08172d3a8a15b46a623232321d59b1f76298a")

package() {
  msg2 "Installing custom license /usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  msg2 "Installing ${pkgname} into /opt"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
