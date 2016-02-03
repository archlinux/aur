# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=PuLP
pkgname=python-${_pkgname,,}
pkgver=1.6.1
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
depends=("python-pyparsing")
conflicts=("python2-pulp")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('78236923bec5d6fd61e2d5398d83c234a19620a15ab72e9a2c0ce1d814e630a6baab428aeba3ed48851d028f949dc69bb388f0cbaa1f35f57be1ada024eaa3e8')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build

	install --directory "$pkgdir"/usr/share/licenses/$pkgname/
	install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
