# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=1.0
pkgrel=1
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
license=('LGPL3')
depends=('fping')
optdepends=('networkmanager')
backup=("etc/opennic-up.conf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0098e4d1ecdfd3fb70cf848601c6687ef8a13aa9e3db6b8f04e86e1a76c6beb3')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname} 
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${pkgname}.{service,timer}
}
