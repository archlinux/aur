# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=mod_jk
pkgver=1.2.49
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

sha1sums=('25dd674678c424053bca903298d19a3aa1b19b7a')
sha512sums=('936eb017ff9d9011996933838d5c306ede9ae1886405f4daed60719ee522cca6075dedb3b647863ef12155cca93f6db8e58209a5d3bbd2da157ffc536a6809f2')
