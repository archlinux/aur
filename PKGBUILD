# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=0.81
pkgrel=1
pkgdesc="OpenNIC auto DNS updater using Network Manager"
arch=('x86_64')
url="https://github.com/kewlfft/opennic-up"
depends=('fping' 'curl' 'networkmanager')
license=('LGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kewlfft/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f16970f2740bf6e8e7e99de3729d19fe6df64ddce51be60da3cad4fa471e1e73')

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
    install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
}
