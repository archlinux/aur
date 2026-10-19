# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: JP-Ellis <josh@jpellis.me>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bibtexparser1
_pyname=bibtexparser
pkgver=1.4.4
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=(any)
url="https://pypi.org/project/bibtexparser/"
license=(LGPL-3.0-only)
depends=(python
         python-pyparsing)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
conflicts=(python-bibtexparser)
#checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('093b6c824f7a71d3a748867c4057b71f77c55b8dbc07efc993b781771520d8fb')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
#	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir/" dist/*.whl
}
