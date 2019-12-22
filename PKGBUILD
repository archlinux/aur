# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-timezone-field
_pypi_pkgname=django-timezone-field
pkgver=4.0
pkgrel=0
pkgdesc="A Django app providing database and form fields for pytz timezone objects"
arch=(any)
url="https://github.com/mfogel/django-timezone-field/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('7e3620fe2211c2d372fad54db8f86ff884098d018d56fda4dca5e64929e05ffc')


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
