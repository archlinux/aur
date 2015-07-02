# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=('python2-oslo-concurrency-liberty')
pkgver=2.1.0
pkgrel=1
pkgdesc="Oslo Concurrency Library"
arch=('any')
url="https://github.com/openstack/oslo.concurrency"
license=('Apache')
provides=("python2-oslo-concurrency")
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/o/oslo.concurrency/oslo.concurrency-${pkgver}.tar.gz")
sha256sums=('22df39a4df14cb323de444e3f00ae3189da11b9faca8b77b6e1551e1e65105d6')

build() {
	cd "$srcdir/oslo.concurrency-$pkgver"
	python2 setup.py build
}

package_python2-oslo-concurrency-liberty() {
	depends=('python2'
	         'python2-pbr>=0.11'
	         'python2-babel>=1.3'
	         'python2-iso8601>=0.1.9'
	         'python2-oslo-config-liberty'
	         'python2-oslo-i18n-liberty'
	         'python2-oslo-utils-liberty'
	         'python2-posix_ipc'
	         'python2-six>=1.9.0'
	         'python2-fasteners>=0.7'
	         'python2-retrying'
)
	cd "$srcdir/oslo.concurrency-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
