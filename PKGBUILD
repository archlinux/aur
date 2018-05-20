# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=0.90
pkgrel=2
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
depends=('fping')
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('00e537bba293566fa71f4c40e91b12bca0f4a568e7e96130459d2536b780d64f')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
    install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
}
