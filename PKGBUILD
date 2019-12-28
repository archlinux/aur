pkgname=quintom-cursor-theme-git
pkgver=r11.d23e573
pkgrel=1
pkgdesc="A cursor theme designed to look decent. Contains Ink and Snow variations."
arch=("any")
url="https://gitlab.com/Burning_Cube/quintom-cursor-theme"
license=("GPL3" "custom:cc-by-sa-4.0")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://gitlab.com/Burning_Cube/quintom-cursor-theme.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	ICONS_DIR="${pkgdir}/usr/share/icons"
	LICENSES_DIR="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${ICONS_DIR}" "${LICENSES_DIR}"
	cd "$srcdir/${pkgname}"
	cp -r "Quintom_Ink Cursors/Quintom_Ink" "Quintom_Snow Cursors/Quintom_Snow" "${pkgdir}/usr/share/icons"
	cp "./LICENSE_CCBYSA" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
