# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=bst-external
pkgver=0.6.1
pkgrel=1
pkgdesc="A collection of extra plugins for BuildStream"
arch=(any)
url="https://gitlab.com/BuildStream/bst-external"
license=(LGPL2.1)
depends=(buildstream python-requests)
makedepends=(python-setuptools python-pytest-runner)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('1ffa975177300252b5a069a78fa51d7efd0a0e9ad38e6551e8a352ebed3eab74')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
