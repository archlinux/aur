# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-snmp-agents
pkgver=9.1.0.57_62
pkgrel=1
pkgdesc="Insight Management SNMP Agents for HP ProLiant Systems"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash hp-health ethtool pciutils net-snmp)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] && depends=(${depends[@]} lib32-gcc-libs)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/RedHatEnterpriseServer/6.2/packages/i386/${pkgname}-${pkgver//_/-}.rhel6.i386.rpm)

package() {
	cp -a "$srcdir/"{etc,opt,sbin,usr,var} "$pkgdir"
}

sha256sums=('f4d603b7208f44506a7d518c672815b5939d0417b7e12e33261d84d4464da115')

