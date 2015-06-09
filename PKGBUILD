# Maintainer: Viliam Tokarcik <viliam@tokarcik.eu>

pkgname=python-django-paypal
_pypi_pkgname=django-paypal
pkgver=0.2.3
pkgrel=2
pkgdesc="A pluggable Django application for integrating PayPal Payments Standard or Payments Pro"
arch=(any)
url="https://pypi.python.org/pypi/django-paypal"
license=('UNKNOWN')
makedepends=('python-setuptools')
depends=('python' 'python-django') 
source=("https://pypi.python.org/packages/source/d/django-paypal/django-paypal-${pkgver}.tar.gz")
md5sums=('bcfbcb14c91a72017c9f6139829f2c23')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
