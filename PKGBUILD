# Maintainer: Philipp A. <flying-sheep@web.de>

_name=session-info2
pkgname=python-$_name
pkgver=0.4.1
pkgrel=1
pkgdesc='Display information about the current Python session.'
arch=(any)
url="https://github.com/scverse/$_name"
license=(MPL-2.0)
depends=(python)
makedepends=(python-hatch-vcs python-hatch-docstring-description python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('3bb2bf7b73b2e13a1737e9aa91a6dae55e2c49e83bee973f24245f31ae264a1f')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
