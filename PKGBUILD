# Maintainer: Philipp A. <flying-sheep@web.de>

_name=qtico
pkgname=python-$_name
pkgver=0.2
pkgrel=6
pkgdesc='Tools for using cross-platform Qt icon themes'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL-3.0)
depends=(python python-qtpy)
makedepends=(python-flit-core python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c10a33df2ffbcceda605660d815b9030c5f759afa5329722192d7aa8f0ec8c09')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
