# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=python2-django-localflavor
_pkgname=django-localflavor
pkgver=1.4.1
pkgrel=1
pkgdesc='Country-specific Django helpers'
arch=(any)
url=https://github.com/django/django-localflavor/
license=(BSD)
depends=(python2-django)
makedepends=(python2-setuptools)
source=(https://github.com/django/${_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('c708183064a7a459b1ae4bc85d27c275df17da47cdd4d917d1763d4d0edf314d')

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
