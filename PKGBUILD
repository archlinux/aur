# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=btrfs-autosnap
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hook which makes btrfs root snapshot before any action."
arch=(any)
url="https://github.com/vvl-rulez/btrfs-autosnap"
license=('MIT')
source=("https://github.com/vvl-rulez/btrfs-autosnap/archive/v$pkgver.tar.gz")
depends=('btrfs-progs' 'util-linux' 'coreutils')
sha256sums=('e49e7905f582dbc46eb2b11d9d99d68c90dc2d905c157a4f7ee4ad9480caa7e7')
backup=('etc/btrfs-autosnap.conf')
package() {
	cd "$pkgname-$pkgver"
	install -Dm644 01-btrfs-autosnap.hook "${pkgdir}/usr/share/libalpm/hooks/01-btrfs-autosnap.hook"
	install -Dm644 btrfs-autosnap.conf "${pkgdir}/etc/btrfs-autosnap.conf"
	install -Dm755 btrfs-autosnap.sh "$pkgdir/usr/bin/btrfs-autosnap"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
