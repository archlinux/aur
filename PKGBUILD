# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tuna
pkgname=python-$_name
pkgver=0.5.15
pkgrel=1
pkgdesc='Python profile viewer'
arch=(any)
url="https://github.com/nschloe/$_name"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0109ab102374ecf5d47f950267b516b6009c3cf48e8caba3b2c859ed3f6fb996')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
