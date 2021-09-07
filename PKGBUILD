# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=WSME
pkgname=python-wsme
pkgver=0.11.0
pkgrel=1
pkgdesc="Simplify the writing of REST APIs, and extend them with additional protocols."
arch=(any)
url="http://git.openstack.org/cgit/openstack/wsme"
license=(MIT)
depends=(
	python
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
md5sums=('42e506444bebe4abe2232403053cd7bc')
sha256sums=('bd2dfc715bedcc8f4649611bc0c8a238f483dc01cff7102bc1efa6bea207b64b')
sha512sums=('5bbf2179a7efa413981ffcb360868875a1283a9cfde02626eb715fe9c61ff05367c62a346011a6d681b8c269c18e115e763f7bf589b456ec81a707bd102f913e')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
