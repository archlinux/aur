# Maintainer: Stick <stick@stma.is>

pkgname=python-geventhttpclient
_name=${pkgname#python-}
pkgver=2.3.7
pkgrel=1
pkgdesc="A high performance, concurrent HTTP client library for python using gevent"
arch=('any')
url='http://github.com/gwik/geventhttpclient'
license=('MIT')
depends=(
	'python-certifi'
	'python-gevent'
	'python-brotli'
	'python-urllib3'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('06c28d3d1aabddbaaf61721401a0e5852b216a1845ef2580f3819161e44e9b1c')
provides=()
conflicts=()

build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
