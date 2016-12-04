# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-celery-beat
_pypi_pkgname=django_celery_beat
pkgver=1.0.1
pkgrel=1
pkgdesc="django-celery-beat enables you to store the periodic task schedule in the django database"
arch=(any)
url="https://pypi.python.org/pypi/django_celery_beat"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-celery')
source=("https://pypi.python.org/packages/f3/80/11489d116003d11dd32974f3122fc0e2d8b2b2829b37ffecacae1c2f0edf/django_celery_beat-${pkgver}.tar.gz")
md5sums=('ae264d14db0375ff86a1d6d172aeb6c6')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
