pkgname=python-sphinxcontrib-spelling
_libname=sphinxcontrib-spelling
pkgver=2.1.2
pkgrel=1
pkgdesc='Sphinx spelling extension'
arch=(any)
url='https://bitbucket.org/birkenfeld/sphinx-contrib/'
license=('BSD')
depends=('python-sphinx')
source=("http://pypi.python.org/packages/source/s/$_libname/$_libname-$pkgver.tar.gz")
sha256sums=('c5ac488141408564cb60f355c50efd90b826a9fc7723738a07ab907a0384f086')

build() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
