# Maintainer: András Wacha <awacha aT gMaIl>
pkgname=monitoring-plugins-snmp-printer
pkgver=0.1.0
pkgrel=1
pkgdesc="Monitoring plugin for Nagios, Icinga etc. for SNMP Printers"
arch=('any')
url="https://exchange.nagios.org/directory/Plugins/Hardware/Printers/check_snmp_printer/details"
license=('GPL')
depends=('net-snmp' 'monitoring-plugins')
makedepends=()
checkdepends=()
source=("https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=633&cf_id=24"
	)

md5sums=('780334d0b97ba015244797481cfea201')


prepare() {
    cp attachment.php\?link_id\=633\&cf_id\=24 check_snmp_printer
#    patch check_kdc < check_kdc.patch
}

package() {
    mkdir -p ${pkgdir}/usr/lib/monitoring-plugins/
    cp check_snmp_printer  ${pkgdir}/usr/lib/monitoring-plugins/check_snmp_printer
    chmod +x ${pkgdir}/usr/lib/monitoring-plugins/check_snmp_printer
}
