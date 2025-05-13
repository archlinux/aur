# Maintainer: Shane Blackthorne <arch@blackthorne.dev>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=snap-pac-grub
pkgver=2.1.0
pkgrel=1
pkgdesc='Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots'
arch=('any')
license=('MIT')
url="https://github.com/maximbaz/$pkgname"
depends=('snap-pac' 'grub-btrfs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname.tar.gz")
sha256sums=('158d0b2fcaf6ae6684efbf6b0a1b2b1eab7462b49ddca2b7a6bd2cd5bd29332c')

package() {
	install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" "grub-mkconfig"
	install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" "zz-snap-pac-postz-grub.hook"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
