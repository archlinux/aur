# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=python2-django-localflavor
_pkgname=django-localflavor
pkgver=1.2
pkgrel=1
pkgdesc='Country-specific Django helpers'
arch=(any)
url=https://github.com/django/django-localflavor/
license=(BSD)
depends=(python2-django)
makedepends=(python2-setuptools)
source=(https://github.com/django/${_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('cadfc8601fc3e48e236a21d9de5b8c7aa5f1a647aa72bec214ce3dc68d0a221a')

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
