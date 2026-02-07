# Maintainer: Philipp A. <flying-sheep@web.de>

_name=session-info2
pkgname=python-$_name
pkgver=0.4
pkgrel=1
pkgdesc='Display information about the current Python session.'
arch=(any)
url="https://github.com/scverse/$_name"
license=(MPL-2.0)
depends=(python)
makedepends=(python-hatch-vcs python-hatch-docstring-description python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bb01bf7c320301d6cbcfad36b85cca7befe537ffd60269be38ae9e1a956f4aa4')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
