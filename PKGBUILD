# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=python-opnieuw
pkgver=2.0.0
pkgrel=1
pkgdesc="A general-purpose retrying library, written in pure Python"
arch=('any')
url="https://github.com/channable/opnieuw"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a34484e2f7b136649691eeefc89f46a95783b3ccab0cc33c118713c037374397')

build() {
	cd "opnieuw-$pkgver"
	python setup.py build
}

check() {
	cd "opnieuw-$pkgver"
	python -m unittest
}

package() {
	cd "opnieuw-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
