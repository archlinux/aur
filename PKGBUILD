# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=python-ypywidgets
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Y-based Jupyter widgets for Python"
url="https://github.com/davidbrochart/ypywidgets"
license=('MIT')
arch=('any')
depends=('python' 'python-comm' 'python-pycrdt' 'python-declare')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
sha256sums=('e0b6a7a1e57afa22a2d6631fb15eb7c93b847452e5a20faf63d44bd620467fdb')
