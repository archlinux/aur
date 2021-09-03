# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-vif
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=2.6.0
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
md5sums=('0e66af9323107e827b8205c5d385794b')
sha256sums=('285a7447b3e40db371438176be85d3c42710279ae4ca5da59809718aff5e4c88')
sha512sums=('1ad6d00025abeff833c82e22f5ec6ce11176b3073e3dba7bca729433f7c8b77b344919b841aef2beb2aa6e606d7d3f19958b414c1d0ec4dcd89089a7866eff1a')

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
