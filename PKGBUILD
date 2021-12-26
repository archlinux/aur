# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-gimmik
pkgver=2.2
pkgrel=1
pkgdesc='Generator of Matrix Multiplication Kernels'
arch=('any')
url="https://github.com/pyfr/gimmik"
license=('BSD')
depends=('python-numpy' 'python-mako')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d5363667cd204c5a72eaa9c999a0465f0b84cde446e07d83b168a3496ae567dc')

build() {
	cd "GiMMiK-$pkgver"
	python setup.py build
}

package() {
	cd "GiMMiK-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.rst AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
}
