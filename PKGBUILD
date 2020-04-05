# Maintainer: NebulaNeko <chfsefefgesfen foxmail>

pkgname=python-cowpy
_pkgname=cowpy
pkgver=1.1.0
pkgrel=1
pkgdesc='A cowsay clone for python in one file.'
arch=('any')
url='https://github.com/jeffbuttars/cowpy'
makedepends=('python-setuptools')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeffbuttars/cowpy/archive/${pkgver}.tar.gz")
sha512sums=('0461519345f0a6f9340da70fe847df024c517c2b237c1e24af493847a4fe41e86c641f5fde888a87fa502975ead51d6d9ec658c1fcccae5887b7545e5b1e055f')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
