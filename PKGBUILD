# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=python-adb-enhanced
_name="${pkgname#python-}"
pkgver=2.5.11
pkgrel=1
pkgdesc="Swiss-army knife for Android testing and development"
arch=("any")
url="https://github.com/ashishb/adb-enhanced"
license=("Apache")
depends=("android-tools" 'python-psutil' 'python-docopt')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b3f8c5f1a1bb27eed67701974f597edefe3bed41c65cee17f5e9b1c0b63bd15c')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
