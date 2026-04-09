# Maintainer: Fabio Di Giorgio <ravnos at duck dot com>

pkgname=zramen-dinit
pkgver=20260408
pkgrel=1
epoch=1
pkgdesc="Advanced zramen dinit service with kernel tweaks and easy configuration"
arch=('any')
url="https://artixlinux.org"
license=('GLWTPL')
install=${pkgname}.install
depends=('zramen' 'dinit')
conflicts=('init-zramen')
provides=('init-zramen')
backup=('etc/dinit.d/config/zramen.conf'
        'etc/sysctl.d/99-zramen.conf')
source=("zramen" "zramen.conf" "99-zramen.conf")
sha256sums=('e8c0ab5702b410df044e103c3db085ff1310661ce140862a1112fc762754edec'
            'a340a9d4d3ae055bf10b818b0073cd12321c923b74a67c2c52f30f5a2cd8c85f'
            '18bd90a40e154d339fcfd6e8c8bb4a5fc2340f7c77abd0fb7eb79cfc117ba19e')

package() {
    install -Dm644 zramen -t "$pkgdir/etc/dinit.d"
    install -Dm644 zramen.conf "$pkgdir/etc/dinit.d/config/zramen.conf"
    install -Dm644 99-zramen.conf -t "$pkgdir/etc/sysctl.d"
}
