# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=enmerkar
pkgname=python-$_pyname
pkgver=0.7.1
pkgrel=2
pkgdesc="Utilities for using Babel in Django"
arch=(any)
url="https://github.com/Zegocover/enmerkar"
license=(BSD)
depends=(
	python
	python-django
	python-babel
)
makedepends=(python-setuptools)
checkdepends=(
	python-pytest
	python-pytest-django
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('a4967fc49a2f6cdaf0f4cf6273508ba8')
sha256sums=('a4a6c859b4ed293deee40ff61d6695b3ff7bc153770a1799f2be872181282e00')
sha512sums=('6d0d0d85fc4057dbc8536220538572000f2816e87874e21a3008f5a05edff46af4b2f09b23acff5813a8174402b3bc4ec8864851f9cc8de50b4386d024b3aeda')

check(){
	cd $_pyname-$pkgver
	export PYTHONPATH=${PWD}
	pytest
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}
