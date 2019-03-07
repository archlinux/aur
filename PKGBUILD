# Maintainer: Philipp A. <flying-sheep@web.de>

_name=future-fstrings
pkgname=python-$_name
pkgver=0.4.5
pkgrel=1
pkgdesc='A backport of fstrings to python<3.6'
arch=(any)
url="https://github.com/asottile/$_name"
license=(MIT)
depends=(python)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('79c2f1b25d7c8d162d0a134471ec904090015122553742bb88c9ac1d60017136')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
