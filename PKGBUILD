# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=channels
pkgver=1.1.8
pkgrel=1
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="https://channels.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django')
optdepends=('python-daphne')
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('b13fdf2275e877bec61e4ddf49b30843')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
