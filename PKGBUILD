# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-locust
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=1
pkgdesc="Developer friendly load testing framework"
arch=('any')
url='https://locust.io/'
license=('MIT')
depends=(
	'python-configargparse'
	'python-flask'
	'python-flask-basicauth'
	'python-gevent'
	'python-geventhttpclient'
	'python-msgpack'
	'python-psutil'
	'python-pyzmq'
	'python-requests'
	'python-werkzeug'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5da627e68b7830074c1eb3d37b6b58b429100d0c7d523e7876c7fe02be6d12cc')
provides=("$pkgname")
conflicts=("$pkgname")

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
