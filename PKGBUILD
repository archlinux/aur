# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=0.93
pkgrel=1
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname}"
depends=('fping' 'curl' 'bash' 'gawk')
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5fcd2733020e546e21d0a29a70046352c7844717e5fa8c84a1540f37f621b564')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
}
