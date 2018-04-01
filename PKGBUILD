# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=("java-design-patterns")
pkgver="1.8.0"
pkgrel=1
pkgdesc="Design patterns implemented in Java"
arch=("any")
url="http://java-design-patterns.com/"
license=("MIT")
optdepends=("java-environment" "maven")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iluwatar/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("53ca57234e17b3dd16de706a7f0f4d947a46a7db9696c916e8038fd2b164be43")

package() {
  msg2 "Installing custom license /usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  msg2 "Installing ${pkgname} into /opt"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
  chown -R ${USER}:users "${pkgdir}/opt/${pkgname}"
}
