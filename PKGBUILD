# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
_name=hilbertcurve
pkgname=python-$_name
pkgver=2.0.5
pkgrel=1
pkgdesc='Converts between one-dimensional distance along a Hilbert curve and n-dimensional points'
arch=('any')
url='https://github.com/galtay/hilbertcurve'
license=('MIT')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6a7703d9a2f1fe748c86d86908bf183e7d139b973645e4b2526e10b34e75796d')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
