# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=linux-preserve-modules
pkgver=1.5.0
pkgrel=1
pkgdesc="a pacman hook that preserves linux kernel modules until reboot"
url="https://aur.archlinux.org/packages/linux-preserve-modules"
arch=('any')
license=('MIT')
depends=()
source=(linux-preserve-modules-pre.hook
        linux-preserve-modules-pre.script
        linux-preserve-modules-post.hook
        linux-preserve-modules-post.script
        linux-preserve-modules)
sha256sums=('167af37f4393b28c9b3bc3ad271d8bcfc37e2d5e5e77ee4e42b0db945543636e'
            '445bb6acf68dbb64f4b2651b3d2a39e607ebbc7e87faa078dea7880f8b2a6302'
            '1b869cce14596206f5046091678a8dc53dca61a82906622aeb192eaa20e262a1'
            'efa8117ba4e8306901449914c7dfe5b7a93b7ef994f9d121c1f3d2e484735a5b'
            'bbaacbb5171931770bb4d202519db4b73d66f6b35a51008592ca2454badb647d')

package() {
    install -Dm644 "$srcdir/linux-preserve-modules-pre.hook" "$pkgdir/usr/share/libalpm/hooks/10-linux-preserve-modules-pre.hook"
    install -Dm755 "$srcdir/linux-preserve-modules-pre.script" "$pkgdir/usr/share/libalpm/scripts/linux-preserve-modules-pre"
    install -Dm644 "$srcdir/linux-preserve-modules-post.hook" "$pkgdir/usr/share/libalpm/hooks/10-linux-preserve-modules-post.hook"
    install -Dm755 "$srcdir/linux-preserve-modules-post.script" "$pkgdir/usr/share/libalpm/scripts/linux-preserve-modules-post"
    install -Dm755 "$srcdir/linux-preserve-modules" "$pkgdir/usr/bin/linux-preserve-modules"
}
