# Maintainer: NeoTheFox <aur at repraptor.33mail.com>
# Maintainer: Henry Graham <henry)dot(arch)at(hgrahamcs)dot(com(>

pkgname=edmarketconnector
pkgver=5.9.5
pkgrel=1
pkgdesc='Downloads commodity market and other station data from the game Elite: Dangerous for use with all popular online and offline trading tools'
arch=('x86_64')
url='https://github.com/EDCD/EDMarketConnector'
license=('GPL2')
provides=('edmarketconnector')
conflicts=('edmarketconnector')
depends=('tk' 'python-certifi' 'python-requests' 'python-watchdog' 'python-semantic-version')
source=("https://github.com/EDCD/EDMarketConnector/archive/Release/${pkgver}.tar.gz" 
        "edmarketconnector.sh"
	"edmarketconnector.desktop")
sha256sums=('f73d2466114ef6396b0edc06305e7b84d968f1f4688bcd854e89c2ca6d1af90a'
            '7be0528d56edfcb444c4a7ba7a18e85296571e7558906c90fe6520c03206242c'
            'fa797932630e7b5e7cc42b0f0f4b20126b5af67661c636885b5486008cb1b13a')

package() {
   mkdir -p ${pkgdir}/usr/lib/edmarketconnector
   mkdir -p ${pkgdir}/usr/bin/
   mkdir -p ${pkgdir}/usr/share/applications
   cp ${srcdir}/EDMarketConnector-Release-${pkgver}/* ${pkgdir}/usr/lib/edmarketconnector -r
   install -m755 edmarketconnector.sh ${pkgdir}/usr/bin/edmarketconnector.sh
   install -m644 edmarketconnector.desktop ${pkgdir}/usr/share/applications/edmarketconnector.desktop
}

