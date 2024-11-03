# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=red-black-tree-mod
pkgname="python-${_pkgname}"
pkgver=1.22
pkgrel=1
pkgdesc="Flexible python implementation of red black trees"
arch=("any")
url="http://stromberg.dnsalias.org/~strombrg/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('38e3652903a2bf96379c27c2082ca0b7b905158662dd7ef0c97f4fd93a9aa908')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
