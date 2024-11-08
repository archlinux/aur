# Maintainer: Philipp A. <flying-sheep@web.de>

_name=hatch-docstring-description
pkgname=python-$_name
pkgver=1.0.3
pkgrel=1
pkgdesc='Derive PyPI package description from Python package docstring.'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL-3.0-or-later)
depends=(python python-hatchling)
makedepends=(python-hatch-vcs python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e047997faed9c86725ec88d7574ee208d90998e8d322fb96c485c3d502b26291')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
