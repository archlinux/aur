# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=4.3
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
	'6069e6145b0286ffc1aa2b6c4250ba771e40b764f8ec352344c9a2e0e563faee'
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
