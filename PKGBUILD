# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Manfred Kern <manfred.kern@gmailcom>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=xom
pkgver=1.3.2
pkgrel=1
pkgdesc="A Java XML Object Model"
arch=('any')
url="http://xom.nu"
license=('LGPL')
makedepends=('apache-ant')
depends=('java-runtime')
source=("http://www.cafeconleche.org/XOM/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c88052ab85dbb67d5330b926ee93d9ed01d96a03704beb521ff12187ab74b463')

build() {
  cd "${srcdir}"/XOM
  ant javadoc
}

package() {
  cd ${srcdir}/XOM
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}/lib
  cp -r lib/*.jar ${pkgdir}/usr/share/java/${pkgname}/lib
  rm ${pkgdir}/usr/share/java/${pkgname}/lib/junit.jar
  cp ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r apidocs ${pkgdir}/usr/share/doc/${pkgname}/
  cd  ${pkgdir}/usr/share/java/
  ln -s ${pkgname}/${pkgname}-${pkgver}.jar ${pkgname}.jar
}
