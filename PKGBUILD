# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pylnk3
_pkgname=pylnk3
pkgver=0.4.3
pkgrel=2
pkgdesc="Python library for reading and writing Windows shortcut files (.lnk)."
url="https://pypi.org/project/pylnk3/"
arch=('any')
license=('LGPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fbc5f512b581382c2a4c11e6df3796f9975bcfd99e3fca2afe531ea61b3c4ac2')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
