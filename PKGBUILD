# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_files
pkgname=obs-service-$_servicename
pkgver=0.5.1
pkgrel=1
pkgdesc="An OBS source service: download files"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
depends=()
source=("https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('895f3cb9beae469e8b39bfaa76a6e5c93d4ea394731f5a1930d0e4a88c40682094b0305da33368cbbf556cc224ba4386e095d7cdad130c0cda1ea03444a2bd15')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 $_servicename.rc "$pkgdir"/etc/obs/services/$_servicename
    install -Dm755 $_servicename "$pkgdir"/usr/lib/obs/service/$_servicename
    install -Dm644 $_servicename.service "$pkgdir"/usr/lib/obs/service/$_servicename.service
}
