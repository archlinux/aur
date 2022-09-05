# Maintainer: Axel Juraske <moin@axju.de>

pkgname=python-mynux
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Just a dotfile manager with some extras."
arch=(any)
url="https://pypi.org/project/mynux/"
license=(MIT)
depends=(python) 
makedepends=(python-build python-installer python-wheel)
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b06a5b6d4b89c91f66fc6a04d3682bad76d2e0f90796cf60afb44ff00cf2b62b')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

