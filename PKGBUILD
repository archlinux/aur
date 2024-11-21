# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Atom Long <atom.long@hotmail.com>

_pkgname=snitun
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.39.1
pkgrel=1
pkgdesc="SNI proxy with TCP multiplexer"
arch=('any')
url="https://github.com/NabuCasa/snitun.git"
license=("GPL-3.0-or-later")
depends=(python-aiohttp python-async-timeout python-attrs python-cryptography)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('fadbe447eea786291d5c52e67eae0658f53a1f68c4b97425e17a9579df503d7e')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
