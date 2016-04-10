# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname="udash-generator"
pkgdesc="Udash project generator"
pkgver=0.1.0
pkgrel=1
url="http://www.udash.io"
license=('custom')
arch=('any')
source=("https://github.com/UdashFramework/udash-generator/releases/download/v${pkgver}/udash-generator-${pkgver}.zip"
        "udash-generator.sh")
md5sums=('c93a583e46438c3618cbdb7505c00899'
         '88d5a254ac9d259bf693cf45c93b2021')
depends=('java-environment')

package(){
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/udash-generator.jar" "${pkgdir}/opt/${pkgname}/udash-generator.jar"
  install -Dm755 "${srcdir}/udash-generator.sh" "${pkgdir}/opt/${pkgname}/udash-generator.sh"
  ln -s "/opt/${pkgname}/udash-generator.sh" "${pkgdir}/usr/bin/udash-generator"
}
