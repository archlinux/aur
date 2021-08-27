# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-locust
_name=${pkgname#python-}
pkgver=2.1.0
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
sha256sums=('1f292b38f6a0818166bb9844a4dcdaed8e5818c357c53a9e853965f8e96d2bc0')
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
