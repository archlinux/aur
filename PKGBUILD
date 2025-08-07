# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=python-opnieuw
pkgver=3.1.0
pkgrel=1
pkgdesc="A general-purpose retrying library, written in pure Python"
arch=('any')
url="https://github.com/channable/opnieuw"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d57ca44672b4a81a6fd73e8d8f039e4cab0149e361c8b0e3a036fa5588544802')

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
