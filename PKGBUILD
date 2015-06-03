# Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: Amish

pkgname=geoip-citydata
pkgver=20150603
pkgrel=1
pkgdesc="City database for geoip IP location lookups"
depends=('geoip')
url='http://www.maxmind.com/'
arch=('any')
license=('CCPL')
source=('http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.xz'
        'http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz')
# skipping md5sums, because of random unscheduled upstream changes, if you want to check, use commented line below
md5sums=('SKIP' 'SKIP')
#md5sums=('fa6ee39b5762b0ac8cf5afd25dbd835a' '18a902730477f26064e38872092eb12f')
    
package() {
    mkdir -p ${pkgdir}/usr/share/GeoIP/
    install -m 444 GeoLiteCity.dat ${pkgdir}/usr/share/GeoIP/
    install -m 444 GeoLiteCityv6.dat ${pkgdir}/usr/share/GeoIP/
    cd "${pkgdir}/usr/share/GeoIP"
    ln -s GeoLiteCity.dat GeoIPCity.dat
    ln -s GeoLiteCityv6.dat GeoIPCityv6.dat
}
