# Maintainer: Nis Donatzsky Hansen <nis at donatzsky dot eu>
pkgname=rofi-script-to-dmenu
pkgver=1.1.0
pkgrel=1
pkgdesc="Run rofi scripts with dmenu (or with dmenu mode of rofi)"
arch=('any')
url="https://github.com/jluttine/${pkgname}"
license=('MIT')
depends=('dmenu')
optdepends=('rofi: Run with dmenu mode of rofi')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/jluttine/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fa4aff98302cdf21b5656ac73a8223141712374ae44e4496ba4e70071fa13a077f3b364f2b035da79473e632bf5d3836368e99cf99aebb5b330f0eda1356864f')

package() {
	cd "$pkgname-$pkgver" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-script-to-dmenu" "$pkgdir/usr/bin/rofi-script-to-dmenu"

	install -Dm755 -d "${doc_path}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
