# Maintainer: Jamin Collins <jamin.collins@gmail.com>

pkgname=mkinitcpio-aoe-utils
pkgver=20211122
pkgrel=1
pkgdesc="tools for AoE root support in mkinitcpio"
arch=('x86_64')
url="https://gitlab.com/jamin.collins/mkinitcpio-aoe-utils"
license=('MIT-0')
depends=()
source=('65-aoe.rules'
	'initcpio-install-aoe'
        'initcpio-hook-aoe')
md5sums=('12a2d8f0c052d5d4744721880b524d1d'
         '20f5f0aaf311f74999c521d4f81f9558'
         'c230c653f86a4d86fea3bdb1e847ccb7')

package() {
    mkdir -p "$pkgdir/usr/lib/udev/rules.d"
    mkdir -p "$pkgdir/usr/lib/initcpio/install"
    mkdir -p "$pkgdir/usr/lib/initcpio/hooks"
    install -m644 "$srcdir/65-aoe.rules" "$pkgdir/usr/lib/udev/rules.d"
    install -m644 "$srcdir/initcpio-install-aoe" "$pkgdir/usr/lib/initcpio/install/aoe"
    install -m644 "$srcdir/initcpio-hook-aoe" "$pkgdir/usr/lib/initcpio/hooks/aoe"
}
