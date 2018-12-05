# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=4.4
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://github.com/madmaxms/iconpack-obsidian"
license=('GPL')
options=(!strip)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/madmaxms/iconpack-obsidian/archive/v$pkgver.tar.gz"
)
sha256sums=(
	'c2409fdce6f9c4d404a7d929f00ef75ec98a26c2f876465af294edcc3c41ab5c'
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
