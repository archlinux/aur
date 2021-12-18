# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=sphobjinv
pkgver=2.1
pkgrel=1
pkgdesc='Toolkit for manipulation and inspection of Sphinx objects.inv files'
arch=(any)
url="https://github.com/bskinn/$pkgname"
license=(MIT)
depends=(
	'python-attrs>=19.2'
	python-certifi
	'python-fuzzywuzzy>=0.8'
	'python-jsonschema>=3.0'
)
makedepends=(install-wheel-scripts)
_pyarch=py3
_wheel="${pkgname/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('24c0aa47fcea4f47dc9487ff83776d7dda2c03425927037d7d2a1b292b1c3323')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
