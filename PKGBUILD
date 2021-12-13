# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=python-adb-enhanced
pkgver=2.5.12
pkgrel=1
pkgdesc="Swiss-army knife for Android testing and development"
arch=("any")
url="https://github.com/ashishb/adb-enhanced"
license=("Apache")
depends=('android-tools' 'java-runtime' 'python-psutil' 'python-docopt')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3986d149f4a6b4d80c1a75493d42b2b0b8da6f823582b9cecd4b4f497e73c3b5')

build() {
	cd "adb-enhanced-$pkgver"
	python setup.py build
}

## tests require an android device; do not add check

package() {
	export PYTHONHASHSEED=0
	cd "adb-enhanced-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
