# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-coolname
pkgver=1.1.0
pkgrel=2
pkgdesc="Random Name and Slug Generator"
arch=('any')
url="https://github.com/alexanderlukanin13/coolname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-six' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/coolname/coolname-$pkgver.tar.gz")
sha256sums=('410fe6ea9999bf96f2856ef0c726d5f38782bbefb7bb1aca0e91e0dc98ed09e3')

build() {
	cd "coolname-$pkgver"
	python setup.py build
}

check() {
	cd "coolname-$pkgver"
	python setup.py pytest
}

package() {
	cd "coolname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
