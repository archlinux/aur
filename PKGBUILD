# Maintainer: Eric Fung <loseurmarbles at gmail dot com>
pkgname=python-foolscap
_pkgname=${pkgname#python-}
pkgver=21.7.0
pkgrel=1
pkgdesc='Remote object-messaging for Python+Twisted'
arch=('any')
url='https://github.com/warner/foolscap'
license=('MIT')
depends=('python-twisted' 'python-pyopenssl')
source=("${url}/archive/refs/tags/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e409d272f888373a84a2a02e7fcf4aa211cba9e0e921a3b3aea91a283a59743f')

build() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
