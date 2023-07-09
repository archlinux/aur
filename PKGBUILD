# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=1.2.2
pkgrel=1
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
license=('LGPL3')
depends=('fping')
optdepends=('networkmanager')
backup=("etc/opennic-up.conf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('afb4745fc82041d1546a6a719f8a66d93bec30b3d3d4b5b5414db7e7cc43b8e7')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname} 
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${pkgname}.{service,timer}
}
