# Maintainer: Philipp A. <flying-sheep@web.de>

_name=hatch-docstring-description
pkgname=python-$_name
pkgver=1.1.1
pkgrel=1
pkgdesc='Derive PyPI package description from Python package docstring.'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL-3.0-or-later)
depends=(python python-hatchling)
makedepends=(python-hatch-vcs python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b15d93c273ba3736abc9e2c542bb42a728a6740703ff5ed85cc072ed49458ae3')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
