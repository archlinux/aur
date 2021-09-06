# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=ovsdbapp
pkgname=python-$_pyname
pkgver=1.12.0
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
md5sums=('3e587890d0f560fe769728c415f27bd1')
sha256sums=('3718185f911fa9da82f75fc0a5ccb3f8228933fd99c6230b7f976a90e7918e87')
sha512sums=('5d432be0a2de600ab994e76bf4d05c1c0665ab6053f2fe76a6f96b9f7bdfa69c449e58fdc28e921adf403a0083ee051a7d19a35ee6eaff3596334e4249f0f9ee')

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
