# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=snap-pac-grub
pkgver=2.0.2
pkgrel=1
pkgdesc='Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots'
arch=('any')
license=('MIT')
url="https://github.com/maximbaz/$pkgname"
depends=('snap-pac' 'grub-btrfs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/$pkgver/$pkgname.tar.gz.sig")
sha256sums=('5b32f06e0e3e97dbc9b1335e79d78cafe1b5d656ba5f9029158fdde6194a5e24'
            'SKIP')
validpgpkeys=('56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

package() {
    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" grub-mkconfig
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" zz-snap-pac-grub-post.hook
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=4 sw=4 et:
