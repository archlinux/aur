# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up
pkgver=0.90
pkgrel=1
pkgdesc="OpenNIC auto dns updater using Network Manager"
arch=('x86_64')
url="https://github.com/kewlfft/opennic-up"
depends=('fping' 'curl' 'networkmanager')
license=('LGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kewlfft/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0ce60fb8b7a4e8c7965aca8dc9b4ca44121cf25177164a690b7cce9692fba8a7')

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
    install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
}
