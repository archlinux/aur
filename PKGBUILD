# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-locust
_name=${pkgname#python-}
pkgver=2.42.6
pkgrel=1
pkgdesc="Developer friendly load testing framework"
arch=('any')
url='https://locust.io/'
license=('MIT')
depends=(
	'python-flask'
	'python-werkzeug'
	'python-requests'
	'python-msgpack'
	'python-pyzmq'
	'python-geventhttpclient'
	'python-configargparse'
	'python-tomli'
	'python-typing_extensions'
	'python-psutil'
	'python-flask-login'
	'python-flask-cors'
	'python-socketio'
	'python-engineio'
	'python-pytest'
)
makedepends=(
	'python-hatch'
	'python-hatch-vcs'
	'python-cryptography'
	'python-pyquery'
	'python-retry'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fa603f4ac1c48b9ac56f4c34355944ebfd92590f4197b6d126ea216bd81cc036')
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
