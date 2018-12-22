# Maintainer: Amish <contact at via dot aur>
pkgname=xtables-geoip-db
pkgver=1.0
pkgrel=1
pkgdesc="GeoIP Database for xtables"
arch=('any')
license=('BSD' 'GPL')
url="https://dev.maxmind.com/geoip/geoip2/geolite2/"
makedepends=('perl-text-csv-xs' 'perl-net-cidr-lite')
_xtver=3.2
source=("http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip"
        "xt_geoip_build::https://sourceforge.net/p/xtables-addons/xtables-addons/ci/v${_xtver}/tree/geoip/xt_geoip_build?format=raw")
sha256sums=('SKIP'
            '216cb5a8c018c9db1cbff6b8a788d71d08f1d23dbb4ae60d318fc62fab1a2b46')

package() {
    cd "${srcdir}"/GeoLite2-Country-CSV_*
    install -d -m 755 "${pkgdir}"/usr/share/xt_geoip
    perl "${srcdir}"/xt_geoip_build -D "${pkgdir}"/usr/share/xt_geoip
}
