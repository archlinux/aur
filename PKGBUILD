# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Eric Fung <loseurmarbles at gmail dot com>
pkgname=python-foolscap
_pkgname=${pkgname#python-}
pkgver=23.11.0
pkgrel=2
pkgdesc='Remote object-messaging for Python+Twisted'
arch=('any')
url='https://github.com/warner/foolscap'
license=('MIT')
depends=('python' 'python-pyopenssl' 'python-six' 'python-twisted' 'python-zope-interface')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${url}/archive/refs/tags/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('99e79c69f2090842e68b3ebc6f333c37426e52a83c1945a08e2b6e9304617ccb')

build() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python -m installer --destdir=${pkgdir} dist/*.whl
}
