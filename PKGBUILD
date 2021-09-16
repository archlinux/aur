# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-banal
pkgver=1.0.6
pkgrel=1
pkgdesc="Commons of banal micro-functions for Python."
license=('MIT')
arch=('any')
url="https://github.com/pudo/banal"
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2814ff0d8a92271dadc222afb4e17fc949413b105c20d7cfe5515f941cdda386')

build() {
	cd "banal-$pkgver"
	python setup.py build
}

package() {
	cd "banal-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
