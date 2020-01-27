# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=sphobjinv
pkgver=2.0.1
pkgrel=1
pkgdesc='Toolkit for manipulation and inspection of Sphinx objects.inv files'
arch=(any)
url="https://github.com/bskinn/$pkgname"
license=(MIT)
depends=(
	'python-attrs>=17.4'
	python-certifi
	'python-fuzzywuzzy>=0.3'
	'python-jsonschema>=2.0'
)
makedepends=(install-wheel-scripts)
_pyarch=py3
_wheel="${pkgname/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('57fcf0672882ce542ce4c6773416c804eeb31c99e5bb83599a12032bd053cad9')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
