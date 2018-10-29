# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=bst-external
pkgver=0.6.2
pkgrel=1
pkgdesc="A collection of extra plugins for BuildStream"
arch=(any)
url="https://gitlab.com/BuildStream/bst-external"
license=(LGPL2.1)
depends=(buildstream python-requests)
makedepends=(python-setuptools python-pytest-runner)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('212a29a32fba8338f0c2225891627cd96a4e763f76dbc3979b5dd3c249ffa4b8')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
