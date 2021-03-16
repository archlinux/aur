# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=WSME
pkgname=python-wsme
pkgver=0.10.1
pkgrel=1
pkgdesc="Simplify the writing of REST APIs, and extend them with additional protocols."
arch=(any)
url="http://git.openstack.org/cgit/openstack/wsme"
license=(MIT)
depends=(
	python
	python-six
	python-webob
	python-simplegeneric
	python-pytz
	python-netaddr
)
makedepends=(
	python
	python-setuptools
)
checkdepends=(
	python-transaction
	python-pecan
	python-sphinx
	python-flask
	python-flask-restful
	python-nose
	python-coverage
	python-webtest
	python-pytest
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('5c22385eb1c2568d7b8ef04400b94265')
sha256sums=('34209b623635a905bcdbc654f53ac814d038da65e4c2bc070ea1745021984079')
sha512sums=('23020d3025c6746eb99db34199225437d78d827ccd3acafcb1eac8604f86e1fe7524cec3afcfccbf7d1f753fd6487e9a5549d2fcaa953949755b1705a95c8d84')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}