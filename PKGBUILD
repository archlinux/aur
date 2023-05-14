# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winacl
_pkgname=winacl
pkgver=0.1.7
pkgrel=1
pkgdesc="ACL/ACE/Security Descriptor manipulation library in pure Python"
url="https://pypi.org/project/winacl/"
arch=('any')
license=('MIT')
depends=('python' )
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ca662c091471a6c629d76c5eec63d8a1bf1af7c054348f09c1242f338850b2bd')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
