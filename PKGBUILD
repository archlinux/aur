# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-arm-gdb
_name=${pkgname#python-}
pkgver=0.9.9
pkgrel=1
epoch=
pkgdesc="Python module for an easier access to analyze ARM Cortex-M peripherals"
arch=('any')
url="https://pypi.org/project/arm-gdb"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(python
)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools-git-versioning-git)
checkdepends=()
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e2a16bbe60e9af770117495c5cf4a7f2bdb3e658b61744d76089b5b4afb12d8d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
