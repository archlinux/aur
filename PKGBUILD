# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-sandman
pkgver=0.9.6
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
sha256sums=('2935f918cb3e58c8402dceee3e6eaa16785d5240e5a3c9a9534995388b618012')

build() {
	cd "$srcdir/sandman-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/sandman-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
}
