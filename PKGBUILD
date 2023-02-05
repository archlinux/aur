# Maintainer: Razer <razer@neuf.fr>

pkgname=python-dj-rest-auth
_pypi_pkgname=dj-rest-auth
pkgver=2.2.7
pkgrel=1
pkgdesc="Dj-rest-auth provides a set of REST API endpoints for Authentication and Registration"
arch=(any)
url="https://github.com/iMerica/dj-rest-auth/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-django-rest-framework')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('911bcf377df68c958a7f534def7715b61f3d887a46fbb53ca7666244b7c0b143')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

