# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>
pkgname=python-pyperclipimg
_name=pyperclipimg
pkgver=0.2.0
pkgrel=1
pkgdesc="Cross-platform copy() and paste() Python functions for images."
arch=('any')
url="https://github.com/asweigart/pyperclipimg"
license=('MIT')
depends=('python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7934402ed7ce898e0a3b659e8cafb7c6a2faf7f9ad00069a0fe15a077aae1239')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
