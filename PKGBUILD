# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=python-ypywidgets_textual
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="Textual widgets for ypywidgets"
url="https://github.com/davidbrochart/ypywidgets-textual"
license=('MIT')
arch=('any')
depends=('python' 'python-ypywidgets' 'python-textual' 'python-pyte' 'python-textual_plotext')
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
sha256sums=('c6ae12ceab65413d16e902f8934e057f13ed93239d01b2b77ab3688991f85274')
