# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=('python2-oslo-concurrency-kilo')
pkgver=1.8.0
pkgrel=1
pkgdesc="Oslo Concurrency Library"
arch=('any')
url="https://github.com/openstack/oslo.concurrency"
license=('Apache')
provides=("python2-oslo-concurrency")
makedepends=('python2-setuptools' 'python2-pbr>=0.8')
source=("https://pypi.python.org/packages/source/o/oslo.concurrency/oslo.concurrency-${pkgver}.tar.gz")
sha256sums=('2070e04106d9d3bdffdd9729a1f0b62a101680001534ba91aa2fdc3967509285')

build() {
	cd "$srcdir/oslo.concurrency-$pkgver"
	python2 setup.py build
}

package_python2-oslo-concurrency-kilo() {
	depends=('python2' 'python2-babel>=1.3' 'python2-iso8601>=0.1.9' 'python2-six>=1.9.0' 'python2-posix_ipc' 'python2-oslo-i18n-kilo>=1.5.0' 'python2-oslo-utils-kilo' 'python2-oslo-config' 'python2-fixtures' 'python2-retrying' 'python2-netaddr>=0.7.12' 'python2-netifaces>=0.10.4' 'python2-pbr>=0.8')
	cd "$srcdir/oslo.concurrency-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
