# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=check-nwc-health
pkgver=7.10.1.8
pkgrel=1
pkgdesc="Monitoring check for various network equipment"
arch=('any')
url='https://labs.consol.de/nagios/check_nwc_health/'
license=('GPL')
depends=('perl')
makedepends=()
optdepends=('perl-soap-lite: checks based on UPnP'
            'perl-xml-libxml: checks based on UPnP'
            'perl-xml-treebuilder: FritzBox checks'
            'perl-json: FritzBox checks')
source=("https://labs.consol.de/assets/downloads/nagios/check_nwc_health-$pkgver.tar.gz")
sha256sums=('e63af97cc1e075676c0ac4788d43d6167af403677ea4922074ccc072dd8e7b0c')

build() {
	cd "check_nwc_health-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins
	make
}

package() {
	cd "check_nwc_health-$pkgver"
	make DESTDIR="$pkgdir/" install
}
