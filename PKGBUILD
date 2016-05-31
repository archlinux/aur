# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-sphinxcontrib-httpdomain
_libname=sphinxcontrib-httpdomain
pkgver=1.5.0
pkgrel=1
pkgdesc="HTTP domain extension for sphinx"
arch=(any)
url="https://bitbucket.org/birkenfeld/sphinx-contrib/"
license=('BSD')
depends=('python-sphinx')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/s/$_libname/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('eab097505caee272ca6a313edb2cbc3d2103bb6bcc09923ef43054e238452f6b')
