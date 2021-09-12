# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-quicktions
pkgver=1.11
pkgrel=1
pkgdesc="Fast fractions implementation in Cython"
arch=('x86_64')
url="https://github.com/scoder/quicktions"
license=('Python')
depends=('glibc')
makedepends=('python-setuptools' 'cython')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7a6c9af50860731a53e48d9fc8547e1d202069e0d01afc2f557dabd7d043b006')

build() {
	cd "quicktions-$pkgver"
	make
}

check() {
	cd "quicktions-$pkgver"
	make test
}

package() {
	cd "quicktions-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
