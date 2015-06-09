# Maintainer: Viliam Tokarcik <viliam@tokarcik.eu>

pkgname=python-django-celery
_pypi_pkgname=django-celery
pkgver=3.1.16
pkgrel=2
pkgdesc="django-celery provides Celery integration for Django"
arch=(any)
url="https://pypi.python.org/pypi/django-celery"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-celery')
source=("https://pypi.python.org/packages/source/d/django-celery/django-celery-${pkgver}.tar.gz")
md5sums=('626c3c5fa91097ab16a7709108b82756')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
