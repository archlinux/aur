# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=ldappool
pkgname=python-$_pyname
pkgver=3.0.0
pkgrel=1
pkgdesc="A simple connector pool for python-ldap."
arch=(any)
url="https://opendev.org/openstack/ldappool"
license=(Apache)
depends=(
	python
	python-ldap
	python-prettytable
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-flake8-docstrings
	python-coverage
	python-fixtures
	python-stestr
	python-testresources
	python-testtools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('edce06b459ebbe8123715dd8e82e5232')
sha256sums=('4bb59b7d6b11407f48ee01a781267e3c8ba98d91f426806ac7208612ae087b86')
sha512sums=('75491fa41b09ab9416397d40a596801c2f1ac133cb3946dcaf2f502414ca8241b72ccd8a106b8e04ff133cd5d568e3ed88795ca8c84b973f7be0c49ba123df31')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}
