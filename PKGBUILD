# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-ujson
pkgver=1.23
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="Ultra fast JSON encoder and decoder for Python."
url="https://github.com/esnme/ultrajson"
license=('BSD')
arch=('i686' 'x86_64')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.zip LICENSE.txt)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py install -O1 --root="$pkgdir"
	install -m0644 -D "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('6fc94fcbf6a6f56fd0814d1eadbfccf35e4215eeba647333ce59dcee03b589f3'
            '45b0247dc589415c76f5e2055bfa073f673870e9eb0b4177cc3c642efb434559')
