# Maintainer: NeoTheFox <aur at repraptor.33mail.com>
# Maintainer: Henry Graham <henry)dot(arch)at(hgrahamcs)dot(com(>

pkgname=edmarketconnector
pkgver=5.10.3
pkgrel=1
pkgdesc='Downloads commodity market and other station data from the game Elite: Dangerous for use with all popular online and offline trading tools'
arch=('x86_64')
url='https://github.com/EDCD/EDMarketConnector'
license=('GPL2')
provides=('edmarketconnector')
conflicts=('edmarketconnector')
depends=('tk' 'python-certifi' 'python-requests' 'python-watchdog' 'python-semantic-version')
source=("https://github.com/EDCD/EDMarketConnector/releases/download/Release%2F${pkgver}/EDMarketConnector-release-${pkgver}.tar.gz" 
        "edmarketconnector.sh"
	"edmarketconnector.desktop")
sha256sums=('a1f07517695bccd6a30726e602f06049d733ec8cf896bc01b030a9f0b897391f'
            '7be0528d56edfcb444c4a7ba7a18e85296571e7558906c90fe6520c03206242c'
            '5f755b86b1b5a3f879be6555cce0c2628006195b95f10fb48df4b1d1d8af6900')

package() {
   mkdir -p ${pkgdir}/usr/lib/edmarketconnector
   mkdir -p ${pkgdir}/usr/bin/
   mkdir -p ${pkgdir}/usr/share/applications
   cp ${srcdir}/EDMarketConnector/* ${pkgdir}/usr/lib/edmarketconnector -r
   install -m755 edmarketconnector.sh ${pkgdir}/usr/bin/edmarketconnector.sh
   install -m644 edmarketconnector.desktop ${pkgdir}/usr/share/applications/edmarketconnector.desktop
}

