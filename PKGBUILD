# Maintainer: Philipp A. <flying-sheep@web.de>

_name=session-info2
pkgname=python-$_name
pkgver=0.2.1
pkgrel=1
pkgdesc='Display information about the current Python session.'
arch=(any)
url="https://github.com/scverse/$_name"
license=(MPL-2.0)
depends=(python)
makedepends=(python-hatch-vcs python-hatch-docstring-description python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f2aa4ae95db7f40239608217d7c077b6a51bc3d897792010ea3794ea799bd69c')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
