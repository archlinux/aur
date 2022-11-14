# Maintainer: Eric Fung <loseurmarbles at gmail dot com>
pkgname=python-foolscap
_pkgname=${pkgname#python-}
pkgver=21.7.0
pkgrel=2
pkgdesc='Remote object-messaging for Python+Twisted'
arch=('any')
url='https://github.com/warner/foolscap'
license=('MIT')
depends=('python-twisted' 'python-pyopenssl')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${url}/archive/refs/tags/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e409d272f888373a84a2a02e7fcf4aa211cba9e0e921a3b3aea91a283a59743f')

build() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python -m installer --destdir=${pkgdir} dist/*.whl
}
