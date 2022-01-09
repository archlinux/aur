# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-log_colorizer
pkgver=2.0.0
pkgrel=1
pkgdesc="Python logging formatter and handler"
arch=('any')
url="https://github.com/Kozea/log_colorizer"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/log_colorizer/log_colorizer-$pkgver.tar.gz")
sha256sums=('8659944cf14b0d46c0c702a3379989bd836b02abbc4150cdf031b8ed5c96c605')

build() {
	cd "log_colorizer-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "log_colorizer-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
