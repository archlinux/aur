# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=mod_jk
pkgver=1.2.40
pkgrel=1
pkgdesc="The Apache Tomcat Connector"
arch=('i686' 'x86_64')
url="http://tomcat.apache.org/connectors-doc/"
license=('Apache')
depends=('java-environment' 'apache')
source=(http://www.eu.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-${pkgver}-src.tar.gz)

package() {
	mkdir -p $pkgdir/usr/lib/httpd/modules
	cd $srcdir/tomcat-connectors-${pkgver}-src/native/

	./configure \
		--prefix=/usr \
		--with-apxs=/usr/sbin/apxs \
		--sysconfdir=/etc
	make

	cd $srcdir/tomcat-connectors-${pkgver}-src/native/
	install -m755 apache-2.0/mod_jk.so $pkgdir/usr/lib/httpd/modules
}

md5sums=('7e6f4e4dbf5261f42ddd1fdbb9ac3e32')
sha256sums=('895e347c4dff74049a848603fb29958e6cf429ea0fc708d514b3a8958236705d')
