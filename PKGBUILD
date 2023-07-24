# Maintainer: Philipp A. <flying-sheep@web.de>
_name=pyRserve
pkgname=python-rserve
pkgver=1.0.1
pkgrel=1
pkgdesc='Python client to remotely access the R statistic package via network'
arch=(any)
url="https://github.com/ralhei/$_name"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools python-build python-installer python-wheel)
#https://github.com/ralhei/pyRserve/issues/31
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8675d17026885f28f30e5463371d3a2d0022f6dd2a81365560eddaf02b233afb')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
