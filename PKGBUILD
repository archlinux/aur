# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-primesieve
pkgver=2.3.0
pkgrel=2
pkgdesc='Python bindings for primesieve library'
license=('MIT')
arch=('x86_64')
url='https://github.com/hickford/primesieve-python'
depends=('python-numpy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/primesieve/primesieve-$pkgver.tar.gz")
sha256sums=('948d9d9502cb45077834892c05d7ac2678834efeca0d39f328715591b27ab3d5')

build() {
	cd "primesieve-$pkgver"
	python setup.py build
}

package() {
	cd "primesieve-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
