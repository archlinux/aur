# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=mod_jk
pkgver=1.2.46
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

sha1sums=('a18c3a8a218d11ea220e6f8a9ae3cdd89dd96e1e')
sha512sums=('3d8e1bdb9c2e0753366242ade47cc986a2fee496f51430acd6837d6a1dbca3b0f7557b8b45dc18f77200bb22a9ec454f48a523a5717022a7316ec448d26bd158')
