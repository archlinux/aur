# Maintainer: András Wacha <awacha aT gMaIl>
pkgname=monitoring-plugins-kdc
pkgver=1.0
pkgrel=1
pkgdesc="Monitoring plugin for Nagios, Icinga etc. for KDCs"
arch=('any')
url="https://exchange.nagios.org/directory/Plugins/Security/check_kdc/details"
license=('GPL' 'Perl-Artistic')
depends=('perl' 'monitoring-plugins')
makedepends=()
checkdepends=()
source=("https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=1287&cf_id=24"
	"check_kdc.patch")
md5sums=('2b86dee78f2f24540edbe846b6504043'
         '9666e179db04e81904b80bea39cb1980')


prepare() {
    cp attachment.php\?link_id\=1287\&cf_id\=24 check_kdc
    patch check_kdc < check_kdc.patch
}

package() {
    mkdir -p ${pkgdir}/usr/lib/monitoring-plugins/
    cp check_kdc  ${pkgdir}/usr/lib/monitoring-plugins/check_kdc
    chmod +x ${pkgdir}/usr/lib/monitoring-plugins/check_kdc
}
