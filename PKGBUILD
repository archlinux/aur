# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-locust
_name=${pkgname#python-}
pkgver=2.16.1
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
sha256sums=('cd54f179b679ae927e9b3ffd2b6a7c89c1078103cfbe96b4dd53c7872774b619')
provides=("$pkgname")
conflicts=("$pkgname")

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
