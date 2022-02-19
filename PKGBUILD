# Maintainer: Philipp A. <flying-sheep@web.de>

_name=qtico
pkgname=python-$_name
pkgver=0.1
pkgrel=3
pkgdesc='Tools for using cross-platform Qt icon themes'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL3)
depends=(python python-pyqt5)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d8d604a85a024fae69ba38149387be0df77ad6e6d4987737527804457a7af429')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
