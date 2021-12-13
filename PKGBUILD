# Maintainer: Henry-Joseph Audéoud <h.audeoud at gmail dot com>

_pkgname='pybrctl'
pkgname="python-${_pkgname}"
pkgver=0.1.3
pkgrel=2
pkgdesc='Pure Python library for managing bridges'
arch=('any')
url='https://pypkg.com/pypi/pybrctl/'
license=('GPL')
depends=()
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cd1a008eb90c2561ce4c18504edf479539eb568094ed89c4dd07b91e182127c2')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py check
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
