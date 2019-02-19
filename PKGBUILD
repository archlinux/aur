# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=divulga
pkgver=18.10.03
pkgrel=1
pkgdesc="Divulgação de Resultado das Eleições"
arch=('any')
url="http://www.tse.jus.br/eleicoes"
license=(custom)
depends=('jdk8-openjdk')
source=("http://divulga.tse.jus.br/downloads/divulga-LINUX.zip"
         'divulga.desktop')
md5sums=('78822b0f416da903414bc6fe32291171'
         '616e69af315a54381ec79a6158d63734')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  install -Dm 644 "divulga.desktop" "${pkgdir}/usr/share/applications/divulga.desktop"
  install -Dm 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv * "${pkgdir}/opt/${pkgname}"
  rm "${pkgdir}/opt/${pkgname}/divulga-LINUX.zip"
  rm "${pkgdir}/opt/${pkgname}/divulga.desktop"
}
