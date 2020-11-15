# Maintainer: NeoTheFox <aur at repraptor.33mail.com>

pkgname=edmarketconnector
pkgver=4.1.4
pkgrel=1
pkgdesc='Downloads commodity market and other station data from the game Elite: Dangerous for use with all popular online and offline trading tools'
arch=('x86_64')
url='https://github.com/EDCD/EDMarketConnector'
license=('GPL')
provides=('edmarketconnector')
conflicts=('edmarketconnector')
depends=('python-certifi' 'python-requests' 'python-watchdog' 'python-semantic-version')
source=("https://github.com/EDCD/EDMarketConnector/archive/Release/${pkgver}.tar.gz" 
        "edmarketconnector.sh")
sha256sums=('05f1cd79eb0d17dad15394e09fcc2f807e4e2c0242d756fee9e4622f3eb76f0a'
            '7be0528d56edfcb444c4a7ba7a18e85296571e7558906c90fe6520c03206242c')

#build() {
#  #cd "${srcdir}/${_projectname}-${_gittag}"
#  python setup.py build
#}

package() {
   mkdir -p ${pkgdir}/usr/lib/edmarketconnector
   mkdir -p ${pkgdir}/usr/bin/
   cp ${srcdir}/EDMarketConnector-Release-${pkgver}/* ${pkgdir}/usr/lib/edmarketconnector -r
   install -m755 edmarketconnector.sh ${pkgdir}/usr/bin/edmarketconnector.sh
}

