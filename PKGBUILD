# Maintainer: Philipp A. <flying-sheep@web.de>

_name=web-pdb
pkgname=python-$_name
pkgver=1.5.6
pkgrel=1
pkgdesc='Web interface for Python’s built-in PDB debugger.'
arch=(any)
url="https://github.com/romanvm/$pkgname"
license=(MIT)
depends=(python-bottle python-asyncore-wsgi)
#checkdepends=(python-selenium)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('00caf906fc5d730c9bd4d3a219e3cbc5b93e334c4beac28a9617fc82275f5e8b')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
