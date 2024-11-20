# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=propcache
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Accelerated property cache"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le' 's390x')
url="https://github.com/pgvector/pgvector-python"
license=('Apache-2.0')
depends=("cython")
makedepends=('python-build' 'python-expandvars' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
