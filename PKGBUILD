# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=channels
pkgver=4.0.0
pkgrel=1
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="http://github.com/django/channels"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-asgiref' 'python-daphne')
optdepends=()
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('0ce53507a7da7b148eaa454526e0e05f7da5e5d1c23440e4886cf146981d8420')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
