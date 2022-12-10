# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-locust
_name=${pkgname#python-}
pkgver=2.13.1
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
	'python-psutil'
	'python-flask-basicauth'
	'python-flask-cors'
	'python-roundrobin'
	'python-typing_extensions'
)
makedepends=(
	'python-cryptography'
	'python-mock'
	'python-pyquery'
	'python-setuptools'
	'python-setuptools-scm'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('875bb048b9845ba2592a65a9583a22a56d7910101cbd831fc4214548c8b54b18')
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
