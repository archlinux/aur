pkgname=python-humancursor
_pyname=HumanCursor
pkgver=1.1.5
pkgrel=1
pkgdesc="Simulate Human Cursor Movement for Automated Scripts"
arch=('any')
url="https://pypi.org/project/HumanCursor/"
license=('unknown')
groups=()
depends=( 'python' 'python-numpy' 'python-selenium' 'python-pyautogui' )
makedepends=( 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' )
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('df34a499af06a215227c792413dfbcaee41bf795860d7cec621575a7f9a9ff76')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd $_pyname-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
