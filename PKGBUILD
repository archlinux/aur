# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-celery-beat
_pypi_pkgname=django-celery-beat
pkgver=1.4.0
pkgrel=0
pkgdesc="django-celery-beat enables you to store the periodic task schedule in the django database"
arch=(any)
url="https://pypi.python.org/pypi/django_celery_beat"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-celery')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('bfc22dad2884524697e1fcdfa63c0555a65151a97902c3045cd2cf7bf63970e4')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
