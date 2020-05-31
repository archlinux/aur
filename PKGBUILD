# Maintainer: Philipp A. <flying-sheep@web.de>

_name=web-pdb
pkgname=python-$_name
pkgver=1.5.3
pkgrel=1
pkgdesc='Web interface for Python’s built-in PDB debugger.'
arch=(any)
url="https://github.com/romanvm/$pkgname"
license=(MIT)
depends=(python-bottle python-asyncore-wsgi)
#makedepends=(python-selenium)  # for tests
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('dbff14dc74adbd88792b9fa585044d297d02324f78dd24b96bf347a30590a08a')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
