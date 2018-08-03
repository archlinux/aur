# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=check-nwc-health
pkgver=7.2
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
sha256sums=('5a4fec3b6602ecd731b3fdae79b2f1d8d5bd5181b28b0b6f38ea4eb2087bb3ff')

build() {
	cd "check_nwc_health-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins
	make
}

package() {
	cd "check_nwc_health-$pkgver"
	make DESTDIR="$pkgdir/" install
}
