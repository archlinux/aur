# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-gimmik
pkgver=2.1
pkgrel=2
pkgdesc='Generator of Matrix Multiplication Kernels'
arch=('any')
url="https://github.com/pyfr/gimmik"
license=('BSD')
depends=('python-numpy>=1.7' 'python-mako')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ed8d90e99ff13b5dd796709abc42f880e3022af98591ed8254aa3e0f89b9bc0e')

build() {
	cd "GiMMiK-$pkgver"
	python setup.py build
}

package() {
	cd "GiMMiK-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
}
