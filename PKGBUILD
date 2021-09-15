# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florijan Hamzic <florijanh@gmail.com>

pkgname=python-pinject
pkgver=0.15.3
pkgrel=1
pkgdesc="Dependency injection library"
arch=('any')
url="https://github.com/google/pinject"
license=('APACHE')
depends=('python-six>=1.7.3' 'python-decorator>=4.3.0')
makedepends=('python-setuptools')
checkdepends=('python-pytest>=3.8.0' 'python-mock>=3.0.5' 'python-semver')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f2489757a8292ea3343855a4c6c1c8c7b8f663f4d26a72cd1e289547e60ac064')

build() {
	cd "pinject-$pkgver"
	python setup.py build
}

check() {
	cd "pinject-$pkgver"
	pytest
}

package() {
	cd "pinject-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
