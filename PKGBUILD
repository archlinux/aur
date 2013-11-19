# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-sphinxcontrib-httpdomain
_libname=sphinxcontrib-httpdomain
pkgver=1.2.0
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

sha256sums=('015e2e4327278a5903a4c060a19bfae821df2d33179c960a301c5383523a4c62')
