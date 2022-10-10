# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycklink
_name=${pkgname#python-}
pkgver=0.0.7
pkgrel=1
epoch=
pkgdesc="Python interface for the T-HEAD CKLink"
arch=('any')
url="https://pypi.org/project/pycklink"
license=('unkown')
groups=()
depends=(python )
makedepends=(python-build python-installer python-wheel)
checkdepends=()
optdepends=()
provides=(cklink pycklink)
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/38/71/f338433daf912f91eb69c2754d3b0a5a67617098d562221e6a83092fda0b/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('a2900d87b291e9cdb483bbd6571a63f6f448d8fd58b078af08a2e68a409fee5b')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
