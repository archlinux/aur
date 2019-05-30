# Maintainer: András Wacha <awacha@gmail.com>
pkgname=monitoring-plugins-qnap
pkgver=1.40
pkgrel=2
pkgdesc="This plugin sends SNMP queries to a QNAP NAS and checks the cpu, HDD status, system temperature, HDD temperature"
arch=( x86_64 )
url="https://exchange.nagios.org/directory/Plugins/Hardware/Storage-Systems/Others/check_qnap"
license=('GPL')
depends=()
source=("check_qnap.sh::https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=5931&cf_id=29"
	"authentication.patch")
md5sums=('b0762dc0ac03cbe43c75e3a367115aa7'
	 'SKIP')

prepare() {
	patch -f ../check_qnap.sh < authentication.patch
}

package() {
	mkdir -p $pkgdir/usr/lib/monitoring-plugins/
	cp check_qnap.sh $pkgdir/usr/lib/monitoring-plugins/check_qnap
	chmod +x $pkgdir/usr/lib/monitoring-plugins/check_qnap
}
