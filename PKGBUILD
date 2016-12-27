# Maintainer: Razer <razer@neuf.fr>

pkgname=python-django-rest-auth
_pypi_pkgname=django-rest-auth
pkgver=0.9.0
pkgrel=1
pkgdesc="Django-rest-auth provides a set of REST API endpoints for Authentication and Registration"
arch=(any)
url="https://github.com/Tivix/django-rest-auth/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-django-rest-framework')
source=("https://github.com/Tivix/django-rest-auth/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



