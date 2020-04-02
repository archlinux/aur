# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-locustio
_name=${pkgname#python-}
pkgver=0.14.5
pkgrel=1
pkgdesc="Scalable user load testing tool written in Python"
arch=('any')
url='https://locust.io/'
license=('MIT')
depends=(
	'python-gevent'
	'python-flask'
	'python-requests'
	'python-msgpack'
	'python-pyzmq'
	'python-geventhttpclient-wheels'
	'python-configargparse'
	'python-psutil'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8ec934226e41ccfdf8d5609050cafcb6449ead09e8697104bfa86739a38dd036')
provides=("$pkgname")
conflicts=("$pkgname")

build() {
	cd "$srcdir"/locustio-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/locustio-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
