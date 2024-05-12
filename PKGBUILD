# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-celery-beat
_pypi_pkgname=django-celery-beat
pkgver=2.6.0
pkgrel=0
pkgdesc="django-celery-beat enables you to store the periodic task schedule in the django database"
arch=(any)
url="https://pypi.python.org/pypi/django_celery_beat"
license=('BSD')
makedepends=(
'python-setuptools'
)
depends=(
'tzdata'
'python'
'python-django'
'python-celery'
'python-python-crontab'
'python-django-timezone-field'
'python-cron-descriptor'
)
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('f75b2d129731f1214be8383e18fae6bfeacdb55dffb2116ce849222c0106f9ad')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
