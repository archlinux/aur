# Maintainer: Philipp A. <flying-sheep@web.de>

_name=session-info2
pkgname=python-$_name
pkgver=0.4.2
pkgrel=1
pkgdesc='Display information about the current Python session.'
arch=(any)
url="https://github.com/scverse/$_name"
license=(MPL-2.0)
depends=(python)
makedepends=(python-hatch-vcs python-hatch-docstring-description python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('d85d730621d6f75df60e15dad21258f2750f04c0c0ee5958a7bf92342c039d76')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
