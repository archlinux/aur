# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-mouser
_name=${pkgname#python-}
pkgver=0.1.6
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
sha256sums=('164c6ff6145f519fc60963724a23e8fb10741322b8934a0fea72d2e25a119328')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
