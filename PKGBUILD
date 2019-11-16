# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-timezone-field
_pypi_pkgname=django-timezone-field
pkgver=3.1
pkgrel=1
pkgdesc="A Django app providing database and form fields for pytz timezone objects"
arch=(any)
url="https://github.com/mfogel/django-timezone-field/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('1a7bbcf984ae191c6dfe713994b4ff4062dc21e47a909356c93e76d027c87c8f')


build() {
#    mv django-celery-beat/* src
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
