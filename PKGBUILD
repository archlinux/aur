# Maintainer: X0rg
# Contributor: u8sand (https://gist.github.com/u8sand/c2ed7dfbf6e4e781f532daf5aab141cb)

pkgname='mirrorlist-rankmirrors-hook'
pkgver=1
pkgrel=2
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
sha512sums=('be000ecfe1964fbf2b15cdceede285a3de12f4caa9bfb58666453b58f592205d20666a2d43849390e2d03b9d03bd192447be0da4b221780c81423f10b4e73578'
            '1ed343d832ef68e4ca839a73e0bb2abd13f95e13aab18398c1fe13450f46315686e40634c3c7dddfeed8eb83e1ca5d48c60c9f0615ab58a51005c753b945ae58'
            '83a8ace99403296572e695ca992182195d5a983042773e00d506129d6e8cf38456f3d19b1e7e8b8c897c5d6ca8a465b627e8014108001d05005f3ad0b2d473e4')

package() {
	install -Dvm755 "$srcdir/mirrorlist-rankmirrors.sh"   "$pkgdir/usr/share/libalpm/scripts/mirrorlist-rankmirrors"
	install -Dvm644 "$srcdir/mirrorlist-rankmirrors.conf" "$pkgdir/etc/pacman.d/mirrorlist-rankmirrors.conf"
	install -Dvm644 "$srcdir/mirrorlist-rankmirrors.hook" "$pkgdir/usr/share/libalpm/hooks/mirrorlist-rankmirrors.hook"
}
