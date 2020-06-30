# Maintainer: Philipp A. <flying-sheep@web.de>

_name=future-fstrings
pkgname=python-$_name
pkgver=1.2.0
pkgrel=1
pkgdesc='A backport of fstrings to python<3.6'
arch=(any)
url="https://github.com/asottile/$_name"
license=(MIT)
depends=(python python-tokenize-rt)
makedepends=(install-wheel-scripts)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('90e49598b553d8746c4dc7d9442e0359d038c3039d802c91c0a55505da318c63')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
