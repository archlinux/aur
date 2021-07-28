# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-factoryboy
pkgver=3.2.0
pkgrel=1
pkgdesc="A test fixtures replacement for Python"
arch=('any')
url="https://github.com/factoryboy/factory_boy"
license=('MIT')
depends=('python>=3.6'
         'python-faker>=0.7.0')
makedepends=('python-setuptools')
# checkdepends=()
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/factory_boy/factory_boy-$pkgver.tar.gz")
sha256sums=('401cc00ff339a022f84d64a4339503d1689e8263a4478d876e58a3295b155c5b')

build() {
	cd "factory_boy-$pkgver"
	python setup.py build
}

package() {
	cd "factory_boy-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
