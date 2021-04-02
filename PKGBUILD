# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=1.1
pkgrel=1
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
license=('LGPL3')
depends=('fping')
optdepends=('networkmanager')
backup=("etc/opennic-up.conf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ef5a976fd19694174d673a9d2d2563c8994f9ab339b70f847d2fecdeac00e10e')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname} 
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${pkgname}.{service,timer}
}
