# Maintainer: Aleksandr <contact at via dot aur>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=activemq
pkgver=5.16.3
pkgrel=1
pkgdesc="Popular and powerful open source messaging and Integration Patterns provider"
arch=('x86_64')
url="https://activemq.apache.org"
license=('Apache 2.0')
depends=('java-runtime' 'lsb-release')
source=("$url/dist/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz"
	    'service'
	    'sysusers')
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

sha256sums=('1846da2985ec64253ecc41a54f1477731eb4750fe840a9dd9fdfee88e5c94252'
            '8a3dbf1130cb66beef6d5bb84636594bbd090663e4ccca5214c8269e0c8a6e1f'
            '3898131d4c696828dd2cca793907417db9471ad6bf9c8014d25a4995796daff7')
