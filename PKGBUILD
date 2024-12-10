# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-libconf
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=0
epoch=
pkgdesc="A pure-Python libconfig reader/writer with permissive license"
arch=('any')
url="https://pypi.org/project/libconf"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
