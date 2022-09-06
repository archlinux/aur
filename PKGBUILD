_name=mizani
pkgname=python-$_name
pkgver=0.7.4
pkgrel=1
pkgdesc='Scales for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(BSD)
depends=(
	python
	python-numpy
	python-pandas
	python-matplotlib
	python-palettable
)
makedepends=(python-setuptools python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b84b923cd3b8b4c0421a750672e5a85ed2aa05e632bd37af8419d5bbf65c397c')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

