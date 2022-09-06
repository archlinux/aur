# Maintainer: Philipp A. <flying-sheep@web.de>

_name=scanpydoc
pkgname=python-$_name
pkgver=0.7.6
pkgrel=1
pkgdesc='A series of Sphinx extensions to get easy to maintain, numpydoc style documentation.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-sphinx python-get_version)
makedepends=(python-flit-core python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('168d53c9b3fbf1775565e37cbf9a4ae014243f722ecfcc2e6fcb023749f4af95')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
