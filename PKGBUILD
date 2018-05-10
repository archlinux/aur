# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=4.1
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
options=(!strip)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/madmaxms/iconpack-obsidian/archive/v$pkgver.tar.gz"
)
sha256sums=(
	'b45cf60faae527bac029e950f131b013c600c66c8813197e0b3dd7a99a04615d'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$pkgver/Obsidian* ${pkgdir}/usr/share/icons/
	# Make sure permissions are consistant
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
	# Install license
	install -Dm644 "$srcdir/iconpack-obsidian-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
