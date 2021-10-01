# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=python-fqdn
_pkgname=fqdn
pkgver=1.5.1
pkgrel=1
pkgdesc="RFC-compliant FQDN validation and manipulation for Python"
arch=('any')
url="https://github.com/ypcrts/fqdn"
license=('MPL2')
makedepends=(
    'python-setuptools'
)
depends=(
    'python'
    'python-cached-property'
)
source=("https://github.com/ypcrts/fqdn/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('805d8be04461dd9f48eb7011d00c3b76')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
