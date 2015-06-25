# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=('python-rackspace-auth-openstack' 'python2-rackspace-auth-openstack')
pkgver=1.3
pkgrel=5
pkgdesc="Rackspace Auth Plugin for OpenStack Clients."
makedepends=('python-setuptools' 'python2-setuptools')
arch=('any')
url="http://pypi.python.org/pypi/rackspace-auth-openstack/"
license=('Apache')
source=(http://pypi.python.org/packages/source/r/rackspace-auth-openstack/rackspace-auth-openstack-${pkgver}.tar.gz)
md5sums=('a75443cb14e3218650bb9dffb46ef8be')

build() {
	cd "$srcdir/rackspace-auth-openstack-$pkgver"
	python setup.py build
	python2 setup.py build
}

package_python-rackspace-auth-openstack() {

	depends=('python')

	cd "$srcdir/rackspace-auth-openstack-$pkgver"
	python setup.py install --root=${pkgdir}
}

package_python2-rackspace-auth-openstack() {
	depends=('python2')

	cd "$srcdir/rackspace-auth-openstack-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
