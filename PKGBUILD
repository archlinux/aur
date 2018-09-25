# Maintainer: Razer <razer@neuf.fr>
pkgname=('python-django-celery-beat-git')
_pkgname=('django-celery-beat')
pkgver=1.1.99
pkgrel=0
pkgdesc="django-celery-beat enables you to store the periodic task schedule in the django database"
arch=(any)
url="https://github.com/celery/django-celery-beat"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-celery')
conflicts=('python-django-celery-beat')
provides=('python-django-celery-beat')
source=("git://github.com/celery/django-celery-beat")
md5sums=('SKIP')


build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
