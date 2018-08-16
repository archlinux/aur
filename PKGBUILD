# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=4.2
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
	'58d69f10422b869382951d20a24c1071fa925d655f4ab71d68af5df5402a4b43'
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
