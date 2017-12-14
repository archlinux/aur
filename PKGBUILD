# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=check-nwc-health
pkgver=6.4.3
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
sha256sums=('e2cab79b8191965e683c40f1edbd6b44249576f5e2f6ae5d7954cb2559c39a60')

build() {
	cd "check_nwc_health-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins
	make
}

package() {
	cd "check_nwc_health-$pkgver"
	make DESTDIR="$pkgdir/" install
}
