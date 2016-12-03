# Maintainer: Frantic1048 <archer@frantic1048.com>
pkgdesc='Fcitx Cangjie5 code table for Colemak layout.'
pkgname='fcitx-table-cangjie5-colemak'
pkgver=r3.c9767e3
pkgrel=1
makedepends=('git')
depends=('fcitx')
conflicts=()
provides=()
arch=('any')
url='https://github.com/frantic1048/fcitx-table-cangjie5-colemak'
license=('GPL')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"

	install -d "${pkgdir}/usr/share/fcitx/table/"
	install -m755 "table/cangjie5-colemak.conf" "${pkgdir}/usr/share/fcitx/table/"
	install -m755 "table/cangjie5-colemak.mb" "${pkgdir}/usr/share/fcitx/table/"
}
