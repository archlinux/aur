# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-tr
pkgver=0.1.2
pkgrel=2
pkgdesc="Pure-Python implementation of the tr algorithm"
arch=('any')
url="https://github.com/ikegami-yukino/python-tr"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('705630c5abd4bfc46e5e799b1002529137b56f730baceffe19a25acc4a9377d5')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
