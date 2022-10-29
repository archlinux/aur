# Maintainer: UnicornDarkness
# Contributor: u8sand (https://gist.github.com/u8sand/c2ed7dfbf6e4e781f532daf5aab141cb)

pkgname='mirrorlist-rankmirrors-hook'
pkgver=2
pkgrel=1
pkgdesc='Pacman hook to automatically rank new mirrors'
url="https://wiki.archlinux.org/index.php/Mirrors#Ranking_an_existing_mirror_list"
license=('unknow')
arch=('any')
depends=('pacman-contrib' 'pacman-mirrorlist')
conflicts=('pacman-mirrorlist-rankmirrors-hook')
replaces=('pacman-mirrorlist-rankmirrors-hook')
backup=('etc/pacman.d/mirrorlist-rankmirrors.conf')
install="$pkgname.install"
source=('mirrorlist-rankmirrors.sh'
	'mirrorlist-rankmirrors.conf'
	'mirrorlist-rankmirrors.hook')
sha512sums=('6e2b2030ee1c0a67158f8b7327235a14adeff4d3670029c1d09c5a4574cf46251f57de057dcc3a0e75df0d196e2748bf66d03e422457e68412fb60a82d03383b'
            '8120a3785029a04f445f04b93240b84ce4b38ce1ed1000a7a56038f3dbf1378008a291818a3850d7f82db709f1804422e18ebeea05af91e99b9509522fa29652'
            '83a8ace99403296572e695ca992182195d5a983042773e00d506129d6e8cf38456f3d19b1e7e8b8c897c5d6ca8a465b627e8014108001d05005f3ad0b2d473e4')

package() {
	install -Dvm755 "$srcdir/mirrorlist-rankmirrors.sh"   "$pkgdir/usr/share/libalpm/scripts/mirrorlist-rankmirrors"
	install -Dvm644 "$srcdir/mirrorlist-rankmirrors.conf" "$pkgdir/etc/pacman.d/mirrorlist-rankmirrors.conf"
	install -Dvm644 "$srcdir/mirrorlist-rankmirrors.hook" "$pkgdir/usr/share/libalpm/hooks/mirrorlist-rankmirrors.hook"
}
