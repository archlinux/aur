# Maintainer: Aleksandr <contact at via dot aur>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=activemq
pkgver=5.15.10
pkgrel=1
pkgdesc="Popular and powerful open source messaging and Integration Patterns provider"
arch=('x86_64')
url="http://activemq.apache.org"
license=('Apache 2.0')
depends=('java-runtime' 'lsb-release')
source=("http://archive.apache.org/dist/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz"
	service
	sysusers)
options=(!strip)
install=install

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname}"
    install -dm0755 "${pkgdir}/usr/lib/sysusers.d"
    install -D -m0644 sysusers "${pkgdir}/usr/lib/sysusers.d/activemq.conf"
    install -D -m0644 service "${pkgdir}/usr/lib/systemd/system/activemq.service"
    mv apache-${pkgname}-${pkgver} "${pkgdir}/opt/${pkgname}/"
    ln -s /opt/activemq/apache-${pkgname}-${pkgver} ${pkgdir}/opt/${pkgname}/current
}

md5sums=('73fa2fdd04ffe04ab64a5e49b49d9dcc'
         '702b858fdb54ff2ba26f25758c01bc3b'
         '4f4459a36f94a0ffdaf4c8bca762cf81')
