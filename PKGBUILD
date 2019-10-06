# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=channels
pkgver=2.3.0
pkgrel=0
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="http://github.com/django/channels"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-asgiref')
optdepends=('python-daphne')
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('5759b4b89fc354101299e5f24b49e83421c12c653c913161858be4c24364a26d')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
