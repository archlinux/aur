# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tooz
pkgname=python-$_pyname
pkgver=3.1.0
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
md5sums=('b2ab720867b00d66b2c30afc182f7290')
sha256sums=('689ba42055fe1fedf4c2d90a58c92e70b8c5df068ef30a483960055c9fcc2c44')
sha512sums=('86fe16dc0dfcb49bc34c720d295daed920e788330581dc41d9d1a3d3d9202cb58ff2f88882f0b84ff48a0618d634080d7b1fb5366e9139bb0b124f7cdce2d540')

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
