# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycklink
_name=${pkgname#python-}
pkgver=0.0.9
pkgrel=1
epoch=
pkgdesc="Python interface for the T-HEAD CKLink"
arch=('any')
url="https://pypi.org/project/pycklink"
license=('MIT')
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/b0/44/34293f3d2ada170ab2668ce138627a3b57d236e9a7c1427738cf0b56ef61/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('6e8b4e4accba6e030a18725749dc854d5714dc023d052c7ff0e441d9eb70fbb3')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
