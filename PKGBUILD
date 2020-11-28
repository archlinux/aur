# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-django-channels
_pypi_pkgname=channels
pkgver=3.0.2
pkgrel=0
pkgdesc="Developer-friendly asynchrony for Django"
arch=(any)
url="http://github.com/django/channels"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-asgiref' 'python-daphne')
optdepends=()
source=("https://pypi.io/packages/source/c/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('f50a6e79757a64c1e45e95e144a2ac5f1e99ee44a0718ab182c501f5e5abd268')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
