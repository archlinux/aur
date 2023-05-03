# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=python-opnieuw
pkgver=1.2.1
pkgrel=1
pkgdesc="A general-purpose retrying library, written in pure Python"
arch=('any')
url="https://github.com/channable/opnieuw"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43b220cea505ac3e23eaf5cc8e180c673a85ee7ce9d60b2fd3fcc3a60ec19304')

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
