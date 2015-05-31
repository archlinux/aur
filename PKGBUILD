# Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: Amish

pkgname=geoip-citydata
pkgver=20150204
pkgrel=2
pkgdesc="City database for geoip IP location lookups"
depends=('geoip')
url='http://www.maxmind.com/'
arch=('any')
license=('CCPL')
source=('http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.xz'
        'http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz')
md5sums=('SKIP' 'SKIP')
    
package() {
    mkdir -p ${pkgdir}/usr/share/GeoIP/
    install -m 444 GeoLiteCity.dat ${pkgdir}/usr/share/GeoIP/
    install -m 444 GeoLiteCityv6.dat ${pkgdir}/usr/share/GeoIP/
    cd "${pkgdir}/usr/share/GeoIP"
    ln -s GeoLiteCity.dat GeoIPCity.dat
    ln -s GeoLiteCityv6.dat GeoIPCityv6.dat
}
