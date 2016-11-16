# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Alexander Boyko <brdcom@ya.ru>
pkgname=activemq
pkgver=5.14.1
pkgrel=1
pkgdesc="Popular and powerful open source messaging and Integration Patterns provider"
arch=('x86_64')
url="http://activemq.apache.org"
license=('Apache 2.0')
depends=('java-runtime' 'lsb-release')
source=(http://archive.apache.org/dist/activemq/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz
	profile.sh
	profile.csh
	service)
options=(!strip)
install=install

package() {
	install -dm0755 "${pkgdir}/opt"
	install -dm0755 "${pkgdir}/usr/share/doc"
	install -dm0755 "${pkgdir}/usr/share/activemq"
	install -dm0755 "${pkgdir}/usr/share/webapps"
	install -dm0755 "${pkgdir}/usr/share/licenses/activemq"
	mv apache-${pkgname}-${pkgver}/docs "${pkgdir}/usr/share/doc/activemq/"
	mv apache-${pkgname}-${pkgver}/examples "${pkgdir}/usr/share/activemq/"
	mv apache-${pkgname}-${pkgver}/webapps "${pkgdir}/usr/share/webapps/activemq"
	mv apache-${pkgname}-${pkgver}/webapps-demo "${pkgdir}/usr/share/webapps/activemq-demo"
	mv apache-${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/activemq/"
	mv apache-${pkgname}-${pkgver}/NOTICE "${pkgdir}/usr/share/licenses/activemq/"
	mv apache-${pkgname}-${pkgver}/README.txt "${pkgdir}/usr/share/doc/activemq/"
	install -D -m0755 profile.sh "${pkgdir}/etc/profile.d/activemq.sh"
	install -D -m0755 profile.csh "${pkgdir}/etc/profile.d/activemq.csh"
	install -D -m0644 service "${pkgdir}/usr/lib/systemd/system/activemq.service"
	mv apache-${pkgname}-${pkgver} "${pkgdir}/opt/activemq"
	
    rm -rf "${pkgdir}/opt/activemq/bin/macosx"
}

md5sums=('dc4fd0485e8234f71ea1f48fdf2b8247'
         '0a1b2ac8850b833a5926f393069eee72'
         '86a4b3f9117acb83ba653859b053f966'
         'c819c4a17a9db352ea24bd90ce032b59')

