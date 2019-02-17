# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=0.93
pkgrel=2
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
license=('LGPL3')
depends=('fping')
optdepends=('networkmanager')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5fcd2733020e546e21d0a29a70046352c7844717e5fa8c84a1540f37f621b564')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname} 
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${pkgname}.{service,timer}
}
