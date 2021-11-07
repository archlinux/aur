# Maintainer: Stick <stick@stma.is>

pkgname=python-geventhttpclient
_name=${pkgname#python-}
pkgver=1.5.3
pkgrel=1
pkgdesc="A high performance, concurrent HTTP client library for python using gevent"
arch=('any')
url='http://github.com/gwik/geventhttpclient'
license=('MIT')
depends=(
	'python-gevent'
	'python-certifi'
	'python-six'
	'python-brotli'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d80ec9ff42b7219f33558185499d0b4365597fc55ff886207b45f5632e099780')
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
