# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-locust
_name=${pkgname#python-}
pkgver=2.5.0
pkgrel=1
pkgdesc="Developer friendly load testing framework"
arch=('any')
url='https://locust.io/'
license=('MIT')
depends=(
	'python-gevent'
	'python-flask'
	'python-werkzeug'
	'python-requests'
	'python-msgpack'
	'python-pyzmq'
	'python-geventhttpclient'
	'python-configargparse'
	'python-flask-basicauth'
	'python-flask-cors'
	'python-roundrobin'
	'python-typing_extensions'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('975e29ad9019db3c5d29eeea7d087c5fd2b643fdbbf1161d445da9fc4308a620')
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
