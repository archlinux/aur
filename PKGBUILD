# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgbase=valley-sans-font
pkgname=(ttf-valley-sans ttf-valley-sans-variable woff2-valley-sans)
pkgdesc='Clear, versatile typeface developed for the Moomin Company'
pkgver=0.0.202606
pkgrel=1
url=https://github.com/HelsinkiTypeStudio/valley-sans
_commit=fb5fda6c08d64734e7980388187474f289757e30
arch=(any)
license=(OFL-1.1)
makedepends=(cairo git make python)
source=("$pkgbase-$pkgver::git+$url#commit=$_commit")
sha256sums=('9c59dcf694bab6da8b9fde913ebc0fe40df61fa3f66eca04d58abe0652520955')

prepare () {
	cd "$pkgbase-$pkgver"
	make venv
}

build () {
	cd "$pkgbase-$pkgver"
	make build
}

package_ttf-valley-sans () {
	install -Dm644 -t "$pkgdir/usr/share/fonts" "$pkgbase-$pkgver/fonts/ttf"/*.ttf
}

package_ttf-valley-sans-variable () {
	pkgdesc+=" (variable)"
	install -Dm644 -t "$pkgdir/usr/share/fonts" "$pkgbase-$pkgver/fonts/variable"/*.ttf
}

package_woff2-valley-sans () {
	pkgdesc+=" (web font)"
	install -Dm644 -t "$pkgdir/usr/share/fonts" "$pkgbase-$pkgver/fonts/webfonts"/*.woff2
}
