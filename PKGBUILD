# Maintainer: Manfred Kern <manfred.kern@gmailcom>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=xom
pkgver=1.2.10
pkgrel=1
pkgdesc="A Java XML Object Model"
arch=('i686' 'x86_64')
url="http://xom.nu"
license="LGPL"
makedepends=('apache-ant')
depends=('java-runtime')
conflicts=('')
source=("http://www.cafeconleche.org/XOM/${pkgname}-${pkgver}.tar.gz")

build() {
	cd "$srcdir"/XOM
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


md5sums=('bf8dcc53740812c9ad0d3d6eea592994')
sha256sums=('d8d58d26cba76f6f9e1a65ab537f759f662d1f4441e9a94b6687e23fdb76f879')
