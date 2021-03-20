# Maintainer: Viliam Tokarcik <viliam@tokarcik.eu>

pkgname=python-django-paypal
_pypi_pkgname=django-paypal
pkgver=1.1
pkgrel=1
pkgdesc="A pluggable Django application for integrating PayPal Payments Standard or Payments Pro"
arch=(any)
url="https://pypi.python.org/pypi/django-paypal"
license=('UNKNOWN')
makedepends=('python-setuptools')
depends=('python' 'python-django') 
source=("https://pypi.python.org/packages/source/d/django-paypal/django-paypal-${pkgver}.tar.gz")
md5sums=('0251e33648152f1c12c9bd420157f466')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
