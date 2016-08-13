# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=python2-django-localflavor
_pkgname=django-localflavor
pkgver=1.3
pkgrel=1
pkgdesc='Country-specific Django helpers'
arch=(any)
url=https://github.com/django/django-localflavor/
license=(BSD)
depends=(python2-django)
makedepends=(python2-setuptools)
source=(https://github.com/django/${_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('5b3768ea9cd824d6329e1292f0f216b9bdeb4df7e72b26856707df654072e263')

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
