# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-tgtg
_name=${pkgname#python-}
pkgver=0.15.0
pkgrel=1
pkgdesc='Unoffical python client for TooGoodToGo API'
arch=(any)
url='https://github.com/ahivert/tgtg-python'
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('60b317e191382a0374d919b3f2030a93fc87b2e1a048fb8642c6877848e76529ce15e5475b53b071d710e2e13dbaafedf859e7c074a412d615f99e9cdbf1ec68')

build() {
	cd "$_name-$pkgver"
	# python -m build --wheel --no-isolation
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	# python -m installer --destdir="$pkgdir" dist/*.whl
	python setup.py install --root="$pkgdir" --optimize=1
}
