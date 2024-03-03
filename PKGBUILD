# Maintainer: Philipp A. <flying-sheep@web.de>

_name=PubChemPy
pkgname=python-pubchempy
pkgver=1.0.4
pkgrel=2
pkgdesc='A simple Python wrapper around the PubChem PUG REST API.'
arch=(any)
url="https://github.com/mcs07/$_name"
license=(MIT)
depends=(python python-alembic python-sqlalchemy)
optdepends=(python-pandas)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('24e9dc2fc90ab153b2764bf805e510b1410700884faf0510a9e7cf0d61d8ed0e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
