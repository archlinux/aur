# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=compressed-rtf
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.6
pkgrel=1
pkgdesc="Compressed Rich Text Format (RTF) compression and decompression package"
arch=("any")
url="https://github.com/delimitry/${_pipname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('c1c827f1d124d24608981a56e8b8691eb1f2a69a78ccad6440e7d92fde1781dd')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
