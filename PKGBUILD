# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=('python2-oslo-serialization-kilo')
pkgver=1.4.0
pkgrel=1
pkgdesc="Oslo Serialization Library"
arch=('any')
url="https://github.com/openstack/oslo.serialization"
license=('Apache')
provides=("python2-oslo-serialization")
makedepends=('python2-setuptools' 'python2-pbr>=0.8')
source=("https://pypi.python.org/packages/source/o/oslo.serialization/oslo.serialization-$pkgver.tar.gz")
md5sums=('e538baeb6869b4c99b94ef42916a2908')

build() {
	cd "$srcdir/oslo.serialization-$pkgver"
	python2 setup.py build
}

package_python2-oslo-serialization-kilo() {
	depends=('python2' 'python2-babel>=1.3' 'python2-iso8601>=0.1.9' 'python2-six>=1.9.0' 'python2-msgpack>=0.4.0' 'python2-oslo-utils-kilo>=1.4.0' 'python2-pytz>=2013.6')
	cd "$srcdir/oslo.serialization-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
