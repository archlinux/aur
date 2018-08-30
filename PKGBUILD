# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=btrfs-autosnap
pkgver=1.0.3
pkgrel=1
pkgdesc="Bash script with Pacman hook which help make btrfs root snapshots fast, simple and automatically."
arch=(any)
url="https://github.com/vvl-rulez/btrfs-autosnap"
license=('MIT')
source=("https://github.com/vvl-rulez/btrfs-autosnap/archive/v$pkgver.tar.gz")
depends=('btrfs-progs' 'util-linux' 'coreutils')
sha256sums=('bf0b877ec2a13cd1f9df519efc262550ceb6a0e9b65040d20b64b3a8c7bd2e1a')
backup=('etc/btrfs-autosnap.conf')
package() {
	cd "$pkgname-$pkgver"
	install -Dm644 01-btrfs-autosnap.hook "${pkgdir}/usr/share/libalpm/hooks/01-btrfs-autosnap.hook"
	install -Dm644 btrfs-autosnap.conf "${pkgdir}/etc/btrfs-autosnap.conf"
	install -Dm755 btrfs-autosnap.sh "$pkgdir/usr/bin/btrfs-autosnap"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
