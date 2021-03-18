# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-vif
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=2.4.0
pkgrel=1
pkgdesc="A library for plugging and unplugging virtual interfaces in OpenStack."
arch=(any)
url="https://docs.openstack.org/os-vif/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-netaddr
	python-oslo-concurrency
	python-oslo-config
	python-oslo-log
	python-oslo-i18n
	python-oslo-privsep
	python-oslo-versionedobjects
	python-ovsdbapp
	python-pyroute2
	python-stevedore
	python-debtcollector
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-coverage
	python-oslotest
	python-ovs-wrapper
	python-stestr
	python-testscenarios
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('4a9eab2861733f0c083204263c745bae')
sha256sums=('f2d4253c27cc49c118a1e877f5158db43862088715726c44ca93f4df16f94b9b')
sha512sums=('a7de513e03d8a511c3ea0a99847197d0fc6bdc8fbe2f9d3e6f5d521f3d237e1f6e6d78e1afe4c2940b660b933c5cd45ba13d19721af2700b7f6f1470641556b6')

export PBR_VERSION=$pkgver

build(){
	cd $_pycname-$pkgver
	python setup.py build
}

package(){
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
