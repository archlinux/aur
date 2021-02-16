# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: hobi82 <hobi82@gmx.net>
# Contributor: Marius Nestor <marius softpedia com>
pkgname=musictube
pkgver=1.14.3
pkgrel=1
pkgdesc="YouTube streaming music player"
arch=('x86_64')
url="https://flavio.tordini.org/musictube"
license=('custom')
depends=('qt5-declarative' 'qt5-x11extras' 'mpv')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('c1edf33158a3848a3b7a477bf8b83bd8da2aba96cf899f46dabdbab42e201659')

package() {
	bsdtar -xvf data.tar.xz -C "$pkgdir"

	# Move license to proper location
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname"

	# Remove deprecated app menu
	rm -rf "$pkgdir/usr/share/menu"
}
