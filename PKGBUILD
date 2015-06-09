# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-dictshield
_libname=dictshield
pkgver=0.4.4
pkgrel=2
pkgdesc="Python Library for typed dictionaries... sorta"
arch=(any)
url="http://github.com/j2labs/dictshield"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz"
        LICENSE.md)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm0644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

sha256sums=('1ca7e2b777d6a43d6fd8d8ac2acfb9f350cba71d104f49689da4e09ebf682248'
            '3b6a6793876fd90603d0b444d0fd0def7bc4ece10b1ad752448001757b9483e4')
