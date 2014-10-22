# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-sphinxcontrib-httpdomain
_libname=sphinxcontrib-httpdomain
pkgver=1.3.0
pkgrel=1
pkgdesc="HTTP domain extension for sphinx"
arch=(any)
url="https://bitbucket.org/birkenfeld/sphinx-contrib/"
license=('BSD')
depends=('python-sphinx')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/s/$_libname/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('ba8fbe82eddc96cfa9d7b975b0422801a14ace9d7e051b8b2c725b92ea6137b5')
