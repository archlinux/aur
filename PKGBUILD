# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=java-design-patterns
pkgver=1.14.0
pkgrel=1
pkgdesc="Design patterns implemented in Java"
arch=("any")
url="http://java-design-patterns.com/"
license=("MIT")
optdepends=("java-environment" "maven")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iluwatar/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("cfcc14ef2634d2746be4812ca4924d80b35aff96d06fd2abb4680f12d0ded939")

package() {
  msg2 "Installing custom license /usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  msg2 "Installing ${pkgname} into /opt"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
