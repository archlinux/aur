# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=pcodedmp
pkgname="python-${_pkgname}"
pkgver=1.2.6
pkgrel=2
pkgdesc="A VBA p-code disassembler"
arch=("any")
url="https://github.com/bontchev/${_pkgname}"
license=('GPL-3.0-or-later')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('025f8c809a126f45a082ffa820893e6a8d990d9d7ddb68694b5a9f0a6dbcd955')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
