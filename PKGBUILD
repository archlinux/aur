# Maintainer: Philipp A. <flying-sheep@web.de>

_name=nbgrader
pkgname=python-$_name
pkgver=0.6.2
pkgrel=1
pkgdesc='A system for assigning and grading notebooks'
arch=(any)
url="https://github.com/jupyter/$_name"
license=(BSD)
depends=(
	python
	python-sqlalchemy
	python-dateutil
	python-traitlets
	python-tornado
	python-requests
	python-jsonschema
	python-alembic
	python-fuzzywuzzy  # python-rapidfuzz
	jupyter
	jupyter-notebook
	jupyter-nbconvert
	jupyter-nbformat
	python-jupyter_core
	python-jupyter_client
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a1d75e087f7a2bc5a8139dca3645d1d01fe1a1c59d0f783b416081e0329f6b50')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
