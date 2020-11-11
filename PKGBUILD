# Maintainer: Stick <stick@stma.is>

pkgname=python-geventhttpclient
_name=${pkgname#python-}
pkgver=1.4.4
pkgrel=1
pkgdesc="A high performance, concurrent HTTP client library for python using gevent"
arch=('any')
url='http://github.com/gwik/geventhttpclient'
license=('MIT')
depends=(
	'python-gevent'
	'python-certifi'
	'python-six'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f59e5153f22e4a0be27b48aece8e45e19c1da294f8c49442b1c9e4d152c5c4c3')
provides=()
conflicts=()

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
