# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=0.99
pkgrel=1
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
license=('LGPL3')
depends=('fping')
optdepends=('networkmanager')
backup=("etc/opennic-up.conf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b50e4711a7846d89b1155a589a7c1c164afcf17c7f1bb6e95b0f8a624b81c674')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname} 
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${pkgname}.{service,timer}
}
