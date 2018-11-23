pkgname=python-sphinxcontrib-spelling
_name=sphinxcontrib_spelling
pkgver=4.2.0
pkgrel=1
pkgdesc='Sphinx spelling extension'
arch=(any)
url='https://bitbucket.org/dhellmann/sphinxcontrib-spelling'
license=('BSD')
depends=('python-sphinx' 'python-pyenchant' 'python-six')
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('e25182225d8380c886000e544024f8513a2e7dad130f8297b8c23db80e31b6ed')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
