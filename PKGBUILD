# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkgname=lru_dict
pkgname="python-lru-dict"
pkgver=1.4.1
pkgrel=1
pkgdesc="A dict like LRU container."
arch=('x86_64')
url="https://github.com/amitdev/lru-dict"
license=("MIT")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cc518ff2d38cc7a8ab56f9a6ae557f91e2e1524b57ed8e598e97f45a2bd708fc')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
