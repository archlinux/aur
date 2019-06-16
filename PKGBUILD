# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=bst-external
pkgver=0.14.0
pkgrel=1
pkgdesc="A collection of extra plugins for BuildStream"
arch=(any)
url="https://gitlab.com/BuildStream/bst-external"
license=(LGPL2.1)
depends=(buildstream python-requests)
makedepends=(python-setuptools)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('d5ebfc216c19796af537c37ad55937d5b95bb12d445d5a3d2faffbd2692ec0e4')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
