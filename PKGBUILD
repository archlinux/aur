# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=btrfs-autosnap
pkgver=1.0.4
pkgrel=1
pkgdesc="Bash script with Pacman hook which help make btrfs root snapshots fast, simple and automatically."
arch=(any)
url="https://github.com/vvl-rulez/btrfs-autosnap"
license=('MIT')
source=("https://github.com/vvl-rulez/btrfs-autosnap/archive/v$pkgver.tar.gz")
depends=('btrfs-progs' 'util-linux' 'coreutils')
sha256sums=('12daf51aad04f6a24ec2445f142f0612749c9ee917bafa0ea4cef4f6e21229c5')
backup=('etc/btrfs-autosnap.conf')
package() {
	cd "$pkgname-$pkgver"
	install -Dm644 01-btrfs-autosnap.hook "${pkgdir}/usr/share/libalpm/hooks/01-btrfs-autosnap.hook"
	install -Dm644 btrfs-autosnap.conf "${pkgdir}/etc/btrfs-autosnap.conf"
	install -Dm755 btrfs-autosnap.sh "$pkgdir/usr/bin/btrfs-autosnap"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
