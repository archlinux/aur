# Maintainer: devome <evinedeng@hotmail.com>

_pipname=backports_zstd
_pkgname="${_pipname//_/-}"
pkgname="python-${_pkgname}"
pkgver=1.2.0
pkgrel=1
pkgdesc="Backport of PEP-784 “adding Zstandard to the standard library”"
arch=("x86_64" "armv7h" "aarch64" "i686")
url="https://github.com/rogdham/${_pipname//_/.}"
license=('PSF-2.0')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pipname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('6c3fc19342db750b52fde793e4440a93575761b1493bb4a1d3b26033d2bd3452')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
