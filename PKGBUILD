# Maintainer: 2ion <dev@2ion.de>
pkgname=qolibri
pkgver=1.0.4
pkgrel=2
pkgdesc="A QT-based EPWING dictionary viewer"
url="http://qolibri.sourceforge.jp/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt4' 'eb-library')
source=("http://dl.sourceforge.jp/${pkgname}/29711/${pkgname}-${pkgver}.src.tar.gz")
md5sums=('127553c5b1ff95ae4c9541324f23d177')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}.src"
  qmake-qt4
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 -p ${srcdir}/${pkgname}-${pkgver}.src/bin/qolibri ${pkgdir}/usr/bin/qolibri
  mkdir -p ${pkgdir}/usr/share/qt/translations/qolibri
  cp -rf ${srcdir}/${pkgname}-${pkgver}.src/src/i18n/*.qm ${pkgdir}/usr/share/qt/translations
  cp -rf ${srcdir}/${pkgname}-${pkgver}.src/src/i18n/qolibri/*sample* ${pkgdir}/usr/share/qt/translations/qolibri
}
