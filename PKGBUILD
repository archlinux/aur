# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=mod_jk
pkgver=1.2.50
pkgrel=1
pkgdesc="The Apache Tomcat Connector"
arch=('i686' 'x86_64')
url="https://tomcat.apache.org/connectors-doc/"
license=('Apache')
depends=('java-environment' 'apache')
source=(https://downloads.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-${pkgver}-src.tar.gz)

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

sha512sums=('9b5a1eb1c0fd38627c574102b3551cdc96fc438b00be5d65770c55b43234af445e642fe8bcbdfe47686b0f3aadab3679340fa76b54b693f57f2273e83ac114ab')
