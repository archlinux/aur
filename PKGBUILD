# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-termplotlib
_name=termplotlib
pkgver=0.3.5
pkgrel=1
pkgdesc="Plotting on the command line"
arch=('any')
url="https://github.com/nschloe/termplotlib"
license=('GPL')
makedepends=('python'
	'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d99d6620a945ed377a4d54c34855c816b54de0e7ba5d6816c2a620abdef46b6d')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
