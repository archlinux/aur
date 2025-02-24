# Maintainer: Philipp A. <flying-sheep@web.de>

_name=qtico
pkgname=python-$_name
pkgver=0.2.1
pkgrel=1
pkgdesc='Tools for using cross-platform Qt icon themes'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL-3.0)
depends=(python python-qtpy)
makedepends=(python-hatchling python-hatch-vcs python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('067b882aabf69e60ec0d45b21aee5556a79ea01ffc6f828caea3a6c8e8d2a2bb')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
