# Maintainer: Maël GUERIN <mael dot guerin at murena dot io>
pkgname=rofi-power-menu
pkgver=3.1.0
pkgrel=1
pkgdesc="Configurable power menu mode for Rofi and dmenu"
arch=('any')
url="https://github.com/jluttine/${pkgname}"
license=('MIT')
# If you want to use dmenu instead, and don't want to install rofi,
# change this to dmenu and also install rofi-script-to-dmenu.
# Full instructions in README/on GitHub.
depends=('rofi')
optdepends=('rofi-script-to-dmenu: Run rofi scripts with dmenu (or with dmenu mode of rofi)'
			'dmenu: Use with dmenu instead of rofi')
provides=('dmenu-power-menu')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/jluttine/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a19c9a3720ae6682f6c11d9c46ce365c3dc5899caec4ad244b4291114c79f5352e61c36e46099893df4f7c921b3bdfb2967b44962c44fdb35820eaa9101ac53f')

package() {
	cd "$pkgname-$pkgver" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-power-menu" "$pkgdir/usr/bin/rofi-power-menu"
	install -Dm755 "dmenu-power-menu" "$pkgdir/usr/bin/dmenu-power-menu"

	install -Dm755 -d "${doc_path}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "screenshot.png" "${doc_path}/screenshot.png"
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
