# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-vif
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=2.5.0
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
md5sums=('5828424c7634c7f6e937a5634f11df65')
sha256sums=('1ac90c9f497950a88a4c1139b1f3512666b7ded7b2375b813b94ad1ff77c6776')
sha512sums=('3b490dd1e35f60ff31de0dfeef891174745e09d2a75ca57696fe3c288caa10149b6bb1a65ed832e58d8b8604744eb31e692ed3ac1e8b3514c0b84074e8a2354e')

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
