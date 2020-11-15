# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=sphobjinv
pkgver=2.1b1
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
sha256sums=('c2b3bd06fcd37ee77a71e081551584a6cc38044c815253ac2396824a4d900bb9')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
