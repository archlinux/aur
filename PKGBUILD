# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: scan


pkgname=obsidian-icon-theme
pkgver=4.9
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
	'f1d6e8fdfd5ac5a4a79b90d9db963e4dd96d952bd2f341f12c721e35e67c2153'
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
