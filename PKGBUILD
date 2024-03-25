# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Geometric neo-gothic humanist sans serif typeface'
pkgname=(ttf-secuela otf-secuela ttf-secuela-variable)
pkgbase=ttf-secuela
pkgver=1.4889dab
pkgrel=2
url=https://github.com/defharo/secuela-variable
license=(OFL-1.1)
arch=(any)
makedepends=(git)
source=("${pkgname}::git+${url}#commit=${pkgver##*.}")
sha512sums=(SKIP)

_package_common () {
	pkgdesc+=" $2"
	install -Dm644 -t "$pkgdir/usr/share/fonts/secuela" \
		"$pkgbase/FONTS/$1"/*
}

package_ttf-secuela () {
	_package_common TTF '(10 static cuts)'
}

package_otf-secuela () {
	_package_common OTF '(10 static cuts)'
}

package_ttf-secuela-variable () {
	_package_common Variable-TT '(variable)'
}
