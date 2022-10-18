# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tuna
pkgname=python-$_name
pkgver=0.5.11
pkgrel=1
pkgdesc='Python profile viewer'
arch=(any)
url="https://github.com/nschloe/$_name"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d47f3e39e80af961c8df016ac97d1643c3c60b5eb451299da0ab5fe411d8866c')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
