# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgbase=valley-sans-font
pkgname=(ttf-valley-sans ttf-valley-sans-variable woff2-valley-sans)
pkgdesc='Clear, versatile typeface developed for the Moomin Company'
pkgver=0.0.202608
pkgrel=1
url=https://github.com/HelsinkiTypeStudio/valley-sans
_commit=f5c2dec81e78da325c6934da87b6a6ad4c236e6a
arch=(any)
license=(OFL-1.1)
makedepends=(cairo git make python)
source=("$pkgbase-$pkgver::git+$url#commit=$_commit")
sha256sums=('e8776ad43ca3c621d45d12920f287ae12cf8f1a98ad956fc534b6c94b62979ee')

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
