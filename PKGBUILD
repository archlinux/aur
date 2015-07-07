# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=('python-oslo-utils' 'python2-oslo-utils')
pkgver=1.7.0
pkgrel=1
pkgdesc="OpenStack Common Libraries - A library of various low-level utility modules"
arch=('any')
url="https://github.com/openstack/oslo.utils"
license=('GPL')
provides=("$pkgname=$pkgver")
makedepends=('python-setuptools' 'python2-setuptools' 'python-pbr>=0.8' 'python2-pbr>=0.8')
source=("https://pypi.python.org/packages/source/o/oslo.utils/oslo.utils-$pkgver.tar.gz")
md5sums=('c95d23c6c7c5601f6c56aaba1e20cfbd')

build() {
	cd "$srcdir/oslo.utils-$pkgver"
	python setup.py build
	python2 setup.py build
}

package_python-oslo-utils() {

	depends=('python' 'python-babel>=1.3' 'python-iso8601>=0.1.9' 'python-six>=1.9.0' 'python-oslo-i18n>=1.5.0' 'python-netaddr>=0.7.12' 'python-netifaces>=0.10.4' 'python-pbr>=0.11' 'python-debtcollector>=0.3.0')

	cd "$srcdir/oslo.utils-$pkgver"
	python setup.py install --root=${pkgdir}
}

package_python2-oslo-utils() {

	depends=('python2' 'python2-babel>=1.3' 'python2-iso8601>=0.1.9' 'python2-six>=1.9.0' 'python2-oslo-i18n>=1.5.0' 'python2-netaddr>=0.7.12' 'python2-netifaces>=0.10.4' 'python2-pbr>=0.11' 'python2-debtcollector>=0.3.0')

	cd "$srcdir/oslo.utils-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
