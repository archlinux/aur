# Maintainer: Philipp A. <flying-sheep@web.de>

_name=sadisplay
pkgname=python-$_name
pkgver=0.4.9
pkgrel=3
pkgdesc='A Sphinx extension for displaying SqlAlchemy models'
arch=(any)
url="https://github.com/sphinx-contrib/$_name"
license=(BSD)
depends=(python-pandas python-sqlalchemy)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('af67160f89123886ab42b247262862bfcde0a3c236229ecdd59de0a1e8e35d96')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
