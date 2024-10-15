# Maintainer: Razer <razer@neuf.fr>

pkgname=python-dj-rest-auth
_pypi_pkgname=dj-rest-auth
pkgver=6.0.0
pkgrel=1
pkgdesc="Dj-rest-auth provides a set of REST API endpoints for Authentication and Registration"
arch=(any)
url="https://github.com/iMerica/dj-rest-auth/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-django-rest-framework')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('760b45f3a07cd6182e6a20fe07d0c55230c5f950167df724d7914d0dd8c50133')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

