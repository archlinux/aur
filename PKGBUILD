# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-sandman
pkgver=0.9.8
pkgrel=1
pkgdesc="Makes things REST"
arch=(any)
url="http://sandman.io"
license=('Apache')
depends=(
    'python-flask'
    'python-flask-sqlalchemy'
    'python-sqlalchemy'
    'python-flask-admin'
    'python-docopt'
)
makedepends=("python-distribute")
source=(http://pypi.python.org/packages/source/s/sandman/sandman-$pkgver.tar.gz)
sha256sums=('83507666077c0ba784b6e388d4eea3d565a6b684300322780c8cf90328026d57')

build() {
	cd "$srcdir/sandman-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/sandman-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
}
