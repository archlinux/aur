# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-robinhood-aiokafka
pkgver=1.1.6
pkgrel=1
pkgdesc="Fork of aiokafka"
arch=('x86_64')
url="https://github.com/robinhood/aiokafka"
license=('Apache')
depends=('python-kafka')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest-runner')
optdepends=()
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c68c0406dde96984c7bf73dcd4ac09dc88472d988e35ac3945792179d8c7a598')

build() {
	cd "aiokafka-$pkgver"
	python setup.py build
}

check() {
	cd "aiokafka-$pkgver"
	python setup.py pytest
}

package() {
	export PYTHONHASHSEED=0
	cd "aiokafka-$pkgver"
	python setup.py install --root "$pkgdir/" --optimize=1 --skip-build
}
