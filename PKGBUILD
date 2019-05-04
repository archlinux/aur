# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgiref
_pypi_pkgname=asgiref
pkgver=3.1.2
pkgrel=0
pkgdesc="Reference ASGI adapters and channel layers"
arch=(any)
url=" http://github.com/django/asgiref/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('60c783a7994246b2e710aa2f0a2f7fcfacf156cffc7b50f7074bfd97c9046db3')

build() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
