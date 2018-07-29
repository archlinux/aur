# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=snap-pac-grub
pkgver=1.0.4
pkgrel=1
pkgdesc="Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots"
arch=("any")
license=("MIT")
depends=("snap-pac" "grub-btrfs")
source=("zz_snap-pac-grub-post.hook"
        "zz_snap-pac-grub-post.hook.sig"
        "grub-mkconfig"
        "grub-mkconfig.sig")
sha256sums=('f3ba22ca35d3ee1d6a5ac1ef4211b9baf831dba0b91033f5cff9adac07fb2f4d'
            'SKIP'
            '95b80a8e75cfcb204a0f21e43ee1fd292e74511ae27b99d5b453a7f5b061ca4b'
            'SKIP')
validpgpkeys=("EB4F9E5A60D32232BB52150C12C87A28FEAC6B20")

package() {
    install -Dm755 grub-mkconfig -t "$pkgdir/usr/share/libalpm/hooks.bin/snap-pac-grub/"
    install -Dm644 zz_snap-pac-grub-post.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}

# vim:set ts=4 sw=4 et:
