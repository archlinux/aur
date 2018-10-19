# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=snap-pac-grub
pkgver=1.0.4
pkgrel=2
pkgdesc='Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots'
arch=('any')
license=('MIT')
depends=('snap-pac' 'grub-btrfs')
source=('zz_snap-pac-grub-post.hook'
        'zz_snap-pac-grub-post.hook.sig'
        'grub-mkconfig'
        'grub-mkconfig.sig')
sha256sums=('1c4e27cc081d1cf9267ab3cecdddbab1cf596e0a3f73b7d5a3e8ab70845e071d'
            'SKIP'
            '95b80a8e75cfcb204a0f21e43ee1fd292e74511ae27b99d5b453a7f5b061ca4b'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" grub-mkconfig
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" zz_snap-pac-grub-post.hook
}

# vim:set ts=4 sw=4 et:
