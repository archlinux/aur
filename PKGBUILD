# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-termplotlib
_name=termplotlib
pkgver=0.3.4
pkgrel=1
pkgdesc="Plotting on the command line"
arch=('any')
url="https://github.com/nschloe/termplotlib"
license=('GPL')
makedepends=('python'
	'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b1ebe3b31ac554db249c2b4cf042b7ba5363f49eeb36c4d1c5e4f15db9fc20ea')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
