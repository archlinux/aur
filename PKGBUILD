# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=linux-preserve-modules
pkgver=1.4.1
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
            '445bb6acf68dbb64f4b2651b3d2a39e607ebbc7e87faa078dea7880f8b2a6302'
            'bbaacbb5171931770bb4d202519db4b73d66f6b35a51008592ca2454badb647d')

package() {
    install -Dm644 "$srcdir/linux-preserve-modules.hook" "$pkgdir/usr/share/libalpm/hooks/10-linux-preserve-modules.hook"
    install -Dm755 "$srcdir/linux-preserve-modules.script" "$pkgdir/usr/share/libalpm/scripts/linux-preserve-modules"
    install -Dm755 "$srcdir/linux-preserve-modules" "$pkgdir/usr/bin/linux-preserve-modules"
}
