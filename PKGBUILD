# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tooz
pkgname=python-$_pyname
pkgver=2.9.0
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
md5sums=('4e9ef713ad9cd5f85fab97e34ea10dcf')
sha256sums=('834faf28ca15cbee45073125ccbfcd11675083c68cd3882b602fa3a79b8de11f')
sha512sums=('56d4d74dc9decee1944b1f5fcc482e3243da5dacdbfaddc33eb408c1362705519a64db8289350ecfca2565c0aa184f9b20a0bdd50da5605c4f8b2dee50e94210')

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
