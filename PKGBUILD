# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=snap-pac-grub
pkgver=1.0.4
pkgrel=4
pkgdesc='Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots'
arch=('any')
license=('MIT')
url="https://github.com/maximbaz/$pkgname"
depends=('snap-pac' 'grub-btrfs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/$pkgver/$pkgname.tar.gz.sig")
sha256sums=('ffc1da79265192e8544bcbce04df397a44414b0087ab78d6855ef0aea14c1429'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" grub-mkconfig
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" zz_snap-pac-grub-post.hook
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=4 sw=4 et:
