# Maintainer: Maxim Baz <archlinux at maximbaz dot com>

pkgname=snap-pac-grub
pkgver=2.0.3
pkgrel=2
pkgdesc='Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots'
arch=('any')
license=('MIT')
url="https://github.com/maximbaz/$pkgname"
depends=('snap-pac' 'grub-btrfs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/$pkgver/$pkgname.tar.gz.sig")
sha256sums=('08e628e8560733583435ce30642a261b6061125183da98a4327b7b89fae9b585'
            'SKIP')
validpgpkeys=('56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

package() {
    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" grub-mkconfig
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" zz-snap-pac-postz-grub.hook
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=4 sw=4 et:
