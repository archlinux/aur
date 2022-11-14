# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=linux-preserve-modules
pkgver=1.2.0
pkgrel=1
pkgdesc="a pacman hook that preserves linux kernel modules until reboot"
url="https://aur.archlinux.org/packages/linux-preserve-modules"
arch=('any')
license=('MIT')
depends=()
source=(linux-preserve-modules.hook
        linux-preserve-modules.script
        linux-preserve-modules)
sha256sums=('666c8f92f798a006b83740afae4dc832e4d38209eb866b2019cb32b8798bfdbf'
            '206fb01f2740fc6359fea93f2280b43e18613a15b629f94581eb1f9f4e53e1d6'
            '6a4ea823aa6020252fdf648792745a731e43a93fd293a663d162ebcf5da3ca5d')

package() {
    install -Dm644 "$srcdir/linux-preserve-modules.hook" "$pkgdir/usr/share/libalpm/hooks/10-linux-preserve-modules.hook"
    install -Dm755 "$srcdir/linux-preserve-modules.script" "$pkgdir/usr/share/libalpm/scripts/linux-preserve-modules"
    install -Dm755 "$srcdir/linux-preserve-modules" "$pkgdir/usr/bin/linux-preserve-modules"
}
