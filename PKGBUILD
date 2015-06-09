# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=python2-django-localflavor
_pkgname=django-localflavor
pkgver=1.1
pkgrel=1
pkgdesc='Country-specific Django helpers'
arch=(any)
url=https://github.com/django/django-localflavor/
license=(BSD)
depends=(python2-django)
makedepends=(python2-setuptools)
source=(https://github.com/django/${_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('541e5b886504b5af39e4b2b7f116cea94daccbf3e779791456b009ec6eb36370')

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
