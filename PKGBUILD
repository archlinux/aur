# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-mouser
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc="Mouser Python API"
url="https://github.com/sparkmicro/mouser-api/"
depends=(
    'python'
    'python-click'
    'python-requests'
)
makedepends=(python-build python-installer python-wheel python-poetry)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1628574eceae806e0e3d9d94c1b1d241d5b4520565b26365dc8f2f11570a0b3c')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
