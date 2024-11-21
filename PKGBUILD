# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=psutil-home-assistant
_pipname="${_pkgname}"
pkgname="python-${_pkgname}"
pkgver=0.0.1
pkgrel=1
pkgdesc="Wrapper for psutil to allow it to be used several times in the same process."
arch=('any')
url="https://github.com/home-assistant-libs/psutil-home-assistant"
license=("Apache-2.0")
depends=("python-psutil")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('ebe4f3a98d76d93a3140da2823e9ef59ca50a59761fdc453b30b4407c4c1bdb8')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
