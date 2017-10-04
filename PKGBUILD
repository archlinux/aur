# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=3.2
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/v$pkgver.tar.gz"
)
sha256sums=(
	'bcd5b714fbe82237a6e61c731a661fad2e56153205068f58d7d817ede663d444'
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
