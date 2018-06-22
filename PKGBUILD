# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=mod_jk
pkgver=1.2.43
pkgrel=1
pkgdesc="The Apache Tomcat Connector"
arch=('i686' 'x86_64')
url="http://tomcat.apache.org/connectors-doc/"
license=('Apache')
depends=('java-environment' 'apache')
source=(https://www.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-${pkgver}-src.tar.gz)

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

sha1sums=('04136649eca7ea42a31564021a7f8959dbcb9822')
sha512sums=('eee06e5eaadd237aa98cd0f6a15c4d8f96edb3b4d8b6b8d9cbdd91abc6b89b50aa75132d76b87791d1800b904d84aea03bafabbe5697541e5ec66bf07cc507f4')
