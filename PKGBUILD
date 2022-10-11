# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycklink
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Python interface for the T-HEAD CKLink"
arch=('any')
url="https://pypi.org/project/pycklink"
license=('MIT')
groups=()
depends=(python)
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('4062abc8a0552ee14d3bb4439ca6f8908855e243402ab3b7dc27b37c1365d1e2')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
