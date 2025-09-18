# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-coolname
pkgver=2.2.0
pkgrel=1
pkgdesc="Random Name and Slug Generator"
arch=('any')
url="https://github.com/alexanderlukanin13/coolname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-six' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/coolname/coolname-$pkgver.tar.gz")
sha256sums=('6c5d5731759104479e7ca195a9b64f7900ac5bead40183c09323c7d0be9e75c7')

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
