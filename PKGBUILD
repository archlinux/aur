pkgname=python-sphinxcontrib-spelling
_name=sphinxcontrib_spelling
pkgver=5.1.2
pkgrel=1
pkgdesc='Sphinx spelling extension'
arch=(any)
url='https://github.com/sphinx-contrib/spelling'
license=('BSD')
depends=('python-sphinx' 'python-pyenchant')
makedepends=('unzip')
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('4c17bc16cdb08a50b430245dfe351d6e5b61b5e86aa5432956f0e4ab41dabc41')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
