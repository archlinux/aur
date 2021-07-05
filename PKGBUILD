# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-slicerator
_name="${pkgname#python-}"
pkgver=1.0.0
pkgrel=1
pkgdesc="A lazy-loading, fancy-sliceable iterable"
url="https://github.com/soft-matter/slicerator"
arch=('any')
license=('BSD')
depends=('python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18e60393e6765ca96986f801bbae62a617a1eba6ed57784e61b165ffc7dc1848')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
