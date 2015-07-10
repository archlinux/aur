# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=('python-os-virtual-interfacesv2-python-novaclient-ext' 'python2-os-virtual-interfacesv2-python-novaclient-ext')
pkgver=0.19
pkgrel=1
pkgdesc="Adds Virtual Interfaces support to python-novaclient"
arch=('any')
url="https://pypi.python.org/pypi/os_virtual_interfacesv2_python_novaclient_ext"
license=('GPL')
depends=('python-novaclient')
provides=("$pkgname=$pkgver")
source=(https://pypi.python.org/packages/source/o/os_virtual_interfacesv2_python_novaclient_ext/os_virtual_interfacesv2_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('bcefe94ab031d523756a6619fc1eea3a')

build() {
	cd "$srcdir/os_virtual_interfacesv2_python_novaclient_ext-$pkgver"
	python setup.py build
	python2 setup.py build

}

package_python-os-virtual-interfacesv2-python-novaclient-ext() {
	makedepends=('python-setuptools')
	cd "$srcdir/os_virtual_interfacesv2_python_novaclient_ext-$pkgver"
	python setup.py install --root=${pkgdir}
}

package_python2-os-virtual-interfacesv2-python-novaclient-ext() {
	makedepends=('python2-setuptools')
	cd "$srcdir/os_virtual_interfacesv2_python_novaclient_ext-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
