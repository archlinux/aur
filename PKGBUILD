# Maintainer: Fabio Di Giorgio <ravnos at duck dot com>

pkgname=zramen-dinit
pkgver=20260408
pkgrel=1
pkgdesc="dinit service scripts for zramen"
arch=('any')
url="https://artixlinux.org"
license=('GLWTPL')
depends=('zramen' 'dinit')
conflicts=('init-zramen' 'zramen-dinit')
provides=('init-zramen')
source=("zramen" "zramen.conf" "99-zramen.conf")
sha256sums=('e8c0ab5702b410df044e103c3db085ff1310661ce140862a1112fc762754edec'
            '1dbf22a1194d07829871641572c95cca90682d86235dd5f3fb15141ce2f51f33'
            '02bc66872b85eefbc763c124a8eacda7009a99775d7977d7116ee5d1d4184ef0')

package() {
    install -Dm644 zramen -t "$pkgdir/etc/dinit.d"
    install -Dm644 zramen.conf "$pkgdir/etc/dinit.d/config/zramen.conf"
    install -Dm644 99-zramen.conf -t "$pkgdir/etc/sysctl.d"
}
