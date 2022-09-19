# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-vif
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=3.0.0
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
md5sums=('201e1c90544dc3ba8c1d0d527cbe82ad')
sha256sums=('dc345bfc24ba76042bba939f27931c8b55b7c7dd76b4528505da75fdd594b919')
sha512sums=('3f7b55f1c69b3b283bc719e9466756d74eea6c78b648938104df0b2336ccc560884ef2e63c3525ccf71ac7fd0ffaabb8c1bc2c0111c1828fb4093b4ffce6c0fa')

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
