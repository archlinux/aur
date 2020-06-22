# Maintainer: Stick <stick@stma.is>

pkgname=python-geventhttpclient
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=2
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
sha256sums=('967b11c4a37032f98c08f58176e4ac8de10473ab0c1f617acb8202d44b97fe21')
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
