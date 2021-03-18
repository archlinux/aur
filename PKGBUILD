# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=ovsdbapp
pkgname=python-$_pyname
pkgver=1.9.0
pkgrel=1
pkgdesc="A library for creating OVSDB applications"
arch=(any)
url="https://pypi.org/project/ovsdbapp/"
license=(Apache)
depends=(
	openvswitch
	python
	python-pbr
	python-fixtures
	python-netaddr
	python-ovs-wrapper
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-hacking
	python-coverage
	python-isort
	python-subunit
	python-oslotest
	python-pylint
	python-stestr
	python-testscenarios
	python-testtools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('770f2c33fb5a7c1e58b26df4d241f284')
sha256sums=('7d17274831a785b611f407bddc0422f7f50f54fe1234a4fcdd8e59f9ab134cf6')
sha512sums=('4d0975cd67e83b6e35b55ef6a932654f3244b99dcc7de2d691a721c551116a636fb27ee60d91bc38fe33678f2a315b2dd7d438d7917df41e42a4f99aa82902b5')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
