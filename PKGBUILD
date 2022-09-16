# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tbvaccine
pkgname=python-$_name
pkgver=0.3.1
pkgrel=3
pkgdesc='Pretty-print Python tracebacks'
arch=(any)
url="https://github.com/skorokithakis/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8665d037ac8ad4c97bc44512de91798565b1226f7b2f59669bb7dbe9a1f87718')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
