# Contributor: Aleksandr <contact at via dot aur>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Christian Hersevoort <contact at via dot aur>
# Contributor: naviisdead <contact at via dot aur>

pkgname=activemq
pkgver=6.1.6
pkgrel=1
pkgdesc="Popular and powerful open source messaging and Integration Patterns provider"
arch=('x86_64')
url="https://activemq.apache.org"
license=('Apache 2.0')
depends=('java-runtime' 'lsb-release')
source=("https://dlcdn.apache.org/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz"
	    'service'
	    'sysusers')
sha512sums=('0ec7809387dc83a08d5b6ceb7adad9dc999d302088f882919d155bf228962a80582695abcd6e8f43f3f6e6d4639aa73ed064b1b28b131f6228d516e7422296b0'
            '5fc6617e5104956603145cbdb62a909f4df7d1b4bd386685e0eaa0257fb7779144b8befae8e2d2f6d1604c487af781f45aff621f12b59b854f66f524bf726b1b'
            '70da58b82ed88644b0095a033821745055c23714d62ff24ef578ad83111b876327f60470de39e34f10246ed8b37ca3084a6087d264d4b07fd8d326c071b29b45')
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

