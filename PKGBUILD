# Maintainer: minus <minus@mnus.de>

pkgname=python-pypeln
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
pkgdesc="A simple yet powerful python library for creating concurrent data pipelines."
arch=(any)
url="https://github.com/cgarciae/pypeln"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
makedepends=('python-setuptools')
depends=(
	'python-cytoolz'
)
sha256sums=('1304a221de6b43257ba664f13a9dee5c97b7f40a7cbe7d7d839627c96dcf68fd')

build() {
	cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
