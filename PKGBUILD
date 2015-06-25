# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=('python-keystoneclient-rackspace' 'python2-keystoneclient-rackspace')
pkgver=0.1.3
pkgrel=1
pkgdesc="Rackspace Auth Plugin for OpenStack Clients."
makedepends=('python-setuptools' 'python2-setuptools')
arch=('any')
url="http://pypi.python.org/pypi/rackspace-keystoneclient-rackspace"
license=('Apache')
source=("https://pypi.python.org/packages/source/p/python-keystoneclient-rackspace/python-keystoneclient-rackspace-${pkgver}.tar.gz")
md5sums=('0db66500c07926465020e3221bf18634')

build() {
	cd "$srcdir/python-keystoneclient-rackspace-$pkgver"
	python setup.py build
	python2 setup.py build
}

package_python-keystoneclient-rackspace() {

	depends=('python' 'python-keystoneclient')

	cd "$srcdir/python-keystoneclient-rackspace-$pkgver"
	python setup.py install --root=${pkgdir}
}

package_python2-keystoneclient-rackspace() {
	depends=('python2' 'python2-keystoneclient')

	cd "$srcdir/python-keystoneclient-rackspace-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
