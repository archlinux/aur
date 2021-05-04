# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=ovsdbapp
pkgname=python-$_pyname
pkgver=1.10.0
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
md5sums=('92a599255fb12e78ebea0f22b3781207')
sha256sums=('3672279288d7ced8251874154d29a3d1ddfbfe7ce950df78f702b939f044ceb5')
sha512sums=('c3108b3dd168b26603f9af12ad518bee8807a4090f3204a81431863d84179980eeb3f887bd1dd1a30b2a7f973d2552740cb756065d39b714a0784bbe04382678')

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
