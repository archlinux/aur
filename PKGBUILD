# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=java-design-patterns
pkgver=1.20.0
pkgrel=1
pkgdesc="Design patterns implemented in Java"
arch=("any")
url="http://${pkgname}.com/"
license=("MIT")
optdepends=("java-environment" "maven")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iluwatar/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("8248687258694d5247c47ddcdf5318ee322f1b82b94bed099d9fa1138b374927")

package() {
  echo "Installing custom license /usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  echo "Installing ${pkgname} into /opt"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
