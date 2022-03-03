# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycklink
_name=${pkgname#python-}
pkgver=0.0.5
pkgrel=1
epoch=
pkgdesc="PYCKLINK"
arch=('any')
url="https://pypi.org/project/pycklink"
license=('unkown')
groups=()
depends=('python' )
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6e/87/f7b1d0785c0fdbeefa830b363b701f16e4f33fbea39f98d9174f08a05c86/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('01e761a36c2a36c9431521fcf5305507e550a70334175ab9b5148f572f54be93')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
