# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=bst-external
pkgver=0.9.0
pkgrel=1
pkgdesc="A collection of extra plugins for BuildStream"
arch=(any)
url="https://gitlab.com/BuildStream/bst-external"
license=(LGPL2.1)
depends=(buildstream python-requests)
makedepends=(python-setuptools python-pytest-runner)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('c49b7d3e065010d266bf34ce2dd451a21c1129c9a6ab08476826d841adfc7ff1')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
