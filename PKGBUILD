# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=bst-external
pkgver=0.12.0
pkgrel=1
pkgdesc="A collection of extra plugins for BuildStream"
arch=(any)
url="https://gitlab.com/BuildStream/bst-external"
license=(LGPL2.1)
depends=(buildstream python-requests)
makedepends=(python-setuptools)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('6b50964265521be3e554bcd8cbb530e297fe04ec65cf26541a30140ad4e3dd90')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
