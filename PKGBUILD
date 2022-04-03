# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=linux-preserve-modules
pkgver=1.0.0
pkgrel=1
pkgdesc="a pacman hook that preserves linux kernel modules until reboot"
url="https://aur.archlinux.org/packages/linux-preserve-modules"
arch=('any')
license=('MIT')
depends=()
source=(preserve-modules-copy.hook
        preserve-modules-link.hook
        preserve-modules.script)
sha256sums=('a38ad3600f174f1882d78191706f668eb1da585bf21ffbd6a0bf63057453f874'
            '276d479596bac1120162ba65229f5253fd4d44b3c44a57a9c4aeb8125fcf01b2'
            '98820ebc17f2420092e947f60181729046cf656e537d364f6a965dccd30d9149')

package() {
    install -Dm644 "$srcdir/preserve-modules-copy.hook" "$pkgdir/usr/share/libalpm/hooks/10-linux-preserve-modules-copy.hook"
    install -Dm644 "$srcdir/preserve-modules-link.hook" "$pkgdir/usr/share/libalpm/hooks/99-linux-preserve-modules-link.hook"
    install -Dm755 "$srcdir/preserve-modules.script" "$pkgdir/usr/share/libalpm/scripts/linux-preserve-modules"
}
