# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-cxxfilt
pkgver=0.3.0
pkgrel=1
pkgdesc="Demangling C++ symbols in Python"
license=('BSD')
arch=('any')
url="https://github.com/afq984/python-cxxfilt"
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cxxfilt/cxxfilt-$pkgver.tar.gz")
sha256sums=('7df6464ba5e8efbf0d8974c0b2c78b32546676f06059a83515dbdfa559b34214')

build() {
	cd "cxxfilt-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "cxxfilt-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
