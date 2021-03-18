# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tooz
pkgname=python-$_pyname
pkgver=2.8.0
pkgrel=1
pkgdesc="Coordination library for distributed systems."
arch=(any)
url="https://docs.openstack.org/tooz/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-stevedore
	python-voluptuous
	python-msgpack
	python-fasteners
	python-tenacity
	python-futurist
	python-oslo-utils
	python-oslo-serialization
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
	consul
	python-sysv_ipc
	python-zake
	python-redis
	python-psycopg2
	python-pymysql
	python-pymemcache
	python-etcd3
	python-etcd3gw
)
checkdepends=(
	python-subunit
	python-testtools
	python-coverage
	python-fixtures
	python-pifpaf
	python-stestr
	python-ddt
	python-nose
	python-pre-commit
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('7f28b5830f76ca52a80603e6397e87c3')
sha256sums=('3567a42097c6292c52634ae3888501756d81a6031eac2cc136a95a6a09a4681e')
sha512sums=('59aca01ffea677dbaa7df20c88c3eeba9b1621d5ac4e86b406d5718304504494724d588b923028cb09b16d15c8a9b3d548f8e9c7e66a29bb4691189eb7d216e4')

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
