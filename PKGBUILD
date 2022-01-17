# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-lief
pkgver=0.11.5
pkgrel=1
pkgdesc="Cross-platform library for parsing, modifying, and abstracting binary formats"
arch=('x86_64')
url="https://github.com/lief-project/lief"
license=('Apache')
depends=('python')
makedepends=('cmake' 'python-setuptools')
checkdepends=()
source=("$pkgname-$pkgver.zip::https://files.pythonhosted.org/packages/source/l/lief/lief-$pkgver.zip")
sha256sums=('932ba495388fb52b4ba056a0b00abe0bda3567ad3ebc6d726be1e87b8be08b3f')

build() {
	cd "lief-$pkgver"
	python setup.py build
}

check() {
	cd "lief-$pkgver"
}

package() {
	export PYTHONHASHSEED=0
	cd "lief-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
