# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=channels
pkgver=3.0.4
pkgrel=1
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="http://github.com/django/channels"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-asgiref' 'python-daphne')
optdepends=()
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('fdd9a94987a23d8d7ebd97498ed8b8cc83163f37e53fc6c85098aba7a3bb8b75')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
