# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=java-design-patterns
pkgver=1.18.0
pkgrel=1
pkgdesc="Design patterns implemented in Java"
arch=("any")
url="http://${pkgname}.com/"
license=("MIT")
optdepends=("java-environment" "maven")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iluwatar/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("0dd8253342faab32a477fbc919f1f9a4ae895b51f2bd18a6d5011c86d5b99e91")

package() {
  msg2 "Installing custom license /usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  msg2 "Installing ${pkgname} into /opt"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
