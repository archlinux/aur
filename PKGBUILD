# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pytest-curio
pkgver=1.0.1
pkgrel=1
pkgdesc='Launch pytest with curio'
arch=('any')
url="https://github.com/johnnoone/pytest-curio"
license=('Apache')
depends=('python-pytest' 'python-curio')
makedepends=('python-setuptools')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('59dd06b2c92e93a2a67326cd2448ddf452bfdb83000e2d76221a4a33a232295a')

build() {
	cd "pytest-curio-$pkgver"
	python setup.py build
}

package() {
	cd "pytest-curio-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
