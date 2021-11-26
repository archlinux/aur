# Maintainer: Jamin Collins <jamin.collins@gmail.com>

pkgname=mkinitcpio-aoe-utils
pkgver=20211126
pkgrel=1
pkgdesc="tools for AoE root support in mkinitcpio"
arch=('x86_64')
url="https://gitlab.com/jamin.collins/mkinitcpio-aoe-utils"
license=('MIT-0')
depends=()
source=('65-aoe.rules'
	'initcpio-install-aoe'
        'initcpio-hook-aoe')
md5sums=('01acda437f29451c54deb9ffbe877f18'
         '5f614fdc62e3a44e2c1fdfe01955b18f'
         'afc422d76e3b47ba7eb6035dc339d87c')

package() {
    mkdir -p "$pkgdir/usr/lib/udev/rules.d"
    mkdir -p "$pkgdir/usr/lib/initcpio/install"
    mkdir -p "$pkgdir/usr/lib/initcpio/hooks"
    install -m644 "$srcdir/65-aoe.rules" "$pkgdir/usr/lib/udev/rules.d"
    install -m644 "$srcdir/initcpio-install-aoe" "$pkgdir/usr/lib/initcpio/install/aoe"
    install -m644 "$srcdir/initcpio-hook-aoe" "$pkgdir/usr/lib/initcpio/hooks/aoe"
}
