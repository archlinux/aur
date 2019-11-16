# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-rest-auth
_pypi_pkgname=django-rest-auth
pkgver=0.9.5
pkgrel=1
pkgdesc="Django-rest-auth provides a set of REST API endpoints for Authentication and Registration"
arch=(any)
url="https://github.com/Tivix/django-rest-auth/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-django-rest-framework')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('f11e12175dafeed772f50d740d22caeab27e99a3caca24ec65e66a8d6de16571')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



