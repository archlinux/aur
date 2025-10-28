# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-celery-beat
_pypi_pkgname=django_celery_beat
pkgver=2.8.1
pkgrel=1
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
sha256sums=('dfad0201c0ac50c91a34700ef8fa0a10ee098cc7f3375fe5debed79f2204f80a')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
