# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=3.5
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
options=(!strip)
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/v$pkgver.tar.gz"
)
sha256sums=(
	'1471fbeca6e58a8d4bba9cef54bbb40227dbde24007fce9bc3c394387a8fcd08'
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
