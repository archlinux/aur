# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycklink
_name=${pkgname#python-}
pkgver=0.0.8
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/cf/2f/ac2d05e83f0e8a55926e8b14e5667cb8f2f28837224661dd96343d0003cc/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('7a4a86ff9ab15ef3db3b68462b05633e8b6879b3c1cbcec5f00484dd80bf38b0')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
