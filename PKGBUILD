# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=python-opnieuw
pkgver=1.2.0
pkgrel=1
pkgdesc="A general-purpose retrying library, written in pure Python"
arch=('any')
url="https://github.com/channable/opnieuw"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e7df8cbbd0f4fe558568ece9f54dd48f6f59b2fb433bace2684827fec646fa4')

build() {
	cd "opnieuw-$pkgver"
	python setup.py build
}

check() {
	cd "opnieuw-$pkgver"
	pytest tests
}

package() {
	cd "opnieuw-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
