# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-schematics
pkgver=0.5
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Python Data Structures for Humans"
url="https://github.com/j2labs/schematics"
makedepends=('python2-distribute')
provides=('python2-dictshield')
replaces=('python2-dictshield')
license=('BSD')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz \
        https://raw.github.com/j2labs/schematics/9fd7087a51044daac9aad1e653ae4185607486f3/docs/LICENSE.md)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --root="$pkgdir"
	install -m0644 -D "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

sha256sums=('d840645ae9f97d130cd94347fd2558aa3fb2558437633f5f5c7119f4f8d44586'
            '3b6a6793876fd90603d0b444d0fd0def7bc4ece10b1ad752448001757b9483e4')
