# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=3.4
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/v$pkgver.tar.gz"
)
sha256sums=(
	'574726207fc0c72e09aa7c679305968b66492c2248b111ed5c722111ddd972d8'
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
