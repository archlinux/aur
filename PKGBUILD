# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=0.91
pkgrel=1
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
depends=('fping')
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('839792ebdeea2428b69c4874166d38547fd6bc8233bf5fc6683137976e8e822d')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
    install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
}
