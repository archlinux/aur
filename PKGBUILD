# Maintainer: Henry-Joseph Audéoud <h.audeoud at gmail dot com>

_pkgname='python-ebtables'
pkgname="${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple Python binding for Ebtables'
arch=('any')
url='https://github.com/ldx/python-ebtables'
license=('GPL2')
depends=('python' 'python-cffi>=0.5.0' 'ebtables')
makedepends=('python-setuptools')
source=("https://github.com/ldx/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('be4c50c78c4c932761cf0586fe755f20')

prepare() {
    patch "${srcdir}/${_pkgname}-${pkgver}"/ebtables.py ../ebtables.py_python2to3.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py check
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
