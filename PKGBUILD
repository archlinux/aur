# Maintainer: Philipp A. <flying-sheep@web.de>

_name=legacy-api-wrap
pkgname=python-$_name
pkgver=1.4.1
pkgrel=1
pkgdesc='Legacy API wrapper.'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(python-hatch-vcs python-hatch-docstring-description python-build python-installer python-wheel)
optdepends=('pytest: testing.legacy_api_wrap.pytest package')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9c40d67aa8312fec8763e87cbf28fea4b67710c79ca7a18137b573d150f3b2b4')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
