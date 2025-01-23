# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=gcp-storage-emulator
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2024.8.3
pkgrel=1
pkgdesc="A stub emulator for the Google Cloud Storage API"
arch=("any")
url="https://github.com/oittaa/${_pkgname}"
license=('BSD-3-Clause')
depends=("python-fs" "python-google-crc32c")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('e5d45e5c23a0344c1c4c44b8f8c36f7e8975ca1fcc5134cab608b96ddccd9225')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
