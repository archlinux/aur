# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=check-nwc-health
pkgver=7.7
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
sha256sums=('dc188c47a8a016803f0eb75ff006ebce48de1cfdb14a881835340444ecebcf52')

build() {
	cd "check_nwc_health-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins
	make
}

package() {
	cd "check_nwc_health-$pkgver"
	make DESTDIR="$pkgdir/" install
}
