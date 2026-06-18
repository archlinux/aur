# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python-stdeb
_name=stdeb
pkgver=0.11.0
pkgrel=1
pkgdesc='Python to Debian source package conversion utility'
arch=('any')
url='https://github.com/astraw/stdeb'
license=(MIT)
depends=(python python-setuptools python-requests)
makedepends=(python-build python-installer)
source=("https://pypi.python.org/packages/source/s/stdeb/stdeb-$pkgver.tar.gz")
md5sums=('4966ae6aa4592c4917078132b102f3d1')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
