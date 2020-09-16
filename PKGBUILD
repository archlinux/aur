# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=xcursor-we10xos
pkgver=20200614
_commit=438dd5be70c3b467b04a8b00cf603f05364c2910
pkgrel=1
pkgdesc='Cursor theme inspired by Windows 10'
license=(GPL)
url=https://github.com/yeyushengfan258/We10XOS-cursors
arch=(any)
makedepends=(inkscape xorg-xcursorgen)
source=("${pkgname}::git+${url}#commit=${_commit}")
sha512sums=(SKIP)

build () {
	cd "${pkgname}"
	bash build.sh
}

package () {
	install -m755 -d "${pkgdir}/usr/share/icons"
	cp -pr "${pkgname}/dist" "${pkgdir}/usr/share/icons/We10XOS-cursors"

	find "${pkgdir}/usr/share/icons/We10XOS-cursors" \
		-type f -exec chmod 644 '{}' \;
	find "${pkgdir}/usr/share/icons/We10XOS-cursors" \
		-type d -exec chmod 755 '{}' \;
}
