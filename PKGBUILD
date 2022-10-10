# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycklink
_name=${pkgname#python-}
pkgver=0.0.6
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6c/92/9ac9175933262cee37ca418b7f7cec6cebdd13dfb53c2454a788bd7cfa9a/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('6b697b8beb1658e4f2276ce08e0539dc405f393724dab5b0a62fa80ddf79111e')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
