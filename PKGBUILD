# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=('python2-oslo-utils-kilo')
pkgver=1.4.0
pkgrel=1
pkgdesc="OpenStack Common Libraries - A library of various low-level utility modules"
arch=('any')
url="https://github.com/openstack/oslo.utils"
license=('GPL')
provides=("python2-oslo-utils")
makedepends=('python2-setuptools' 'python2-pbr>=0.8')
source=("https://pypi.python.org/packages/source/o/oslo.utils/oslo.utils-$pkgver.tar.gz")
md5sums=('b488b9c25fc1ab9c563b90b937e92b61')

build() {
	cd "$srcdir/oslo.utils-$pkgver"
	python2 setup.py build
}

package_python2-oslo-utils-kilo() {
	depends=('python2' 'python2-babel>=1.3' 'python2-iso8601>=0.1.9' 'python2-six>=1.9.0' 'python2-oslo-i18n-kilo>=1.5.0' 'python2-netaddr>=0.7.12' 'python2-netifaces>=0.10.4' 'python2-pbr>=0.8')
	cd "$srcdir/oslo.utils-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
