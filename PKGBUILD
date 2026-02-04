# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-coolname
pkgver=3.0.0
pkgrel=1
pkgdesc="Random Name and Slug Generator"
arch=('any')
url="https://github.com/alexanderlukanin13/coolname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-six' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/coolname/coolname-$pkgver.tar.gz")
sha256sums=('01eb22437f77a904d5cb993842b3cd07e182e707014a82f3dfa31881968ecee1')

build() {
	cd "coolname-$pkgver"
	python setup.py build
}

check() {
	cd "coolname-$pkgver"
	pytest
}

package() {
	cd "coolname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
