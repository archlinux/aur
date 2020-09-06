# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Adhityaa Chandrasekar <c.adhityaa@gmail.com>

pkgname=python-unidiff
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple Python library to parse and interact with unified diff data."
arch=('any')
url="https://github.com/matiasb/python-unidiff"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('00bd92c4988a2daba239222e579284da48983f81b929fad4249949d6a5496723')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	pytest
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
