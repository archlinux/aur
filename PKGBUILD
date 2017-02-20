# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=PuLP
pkgname=python-${_pkgname,,}
pkgver=1.6.2
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
depends=("python-pyparsing")
conflicts=("python2-pulp")
source=("https://pypi.python.org/packages/c3/06/c503f803e09447416b382e5a567458db39fa67d871ff4f005ee732886557/$_pkgname-$pkgver.zip")
sha512sums=('df7590c2ab2b0de4006bafdaf6f75a8b530aca9a1db6201c6c8dc5561137ad4200760d649cc0a6988e58d1192cf5de6f7bb4f5094868d9165cf8f7c43b8ac184')

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
