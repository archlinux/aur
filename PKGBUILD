# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-csnake
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="C code generation helper package."
url="https://gitlab.com/andrejr/csnake"
depends=('python')
makedepends=(python-build python-installer python-wheel python-poetry)
optdepends=(
    'python-numpy'
    'python-scipy'
    'python-pillow'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dfed729c6f32ff44fd09797328aff5f077088a479c7da4bfa3af55dc6310bef2')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
