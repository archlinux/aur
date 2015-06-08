# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python2-pygeocoder
_pkgname=pygeocoder
pkgver=1.2.5
pkgrel=1
pkgdesc="Library that helps you make use of Google's Geocoding functionality."
arch=(any)
url=http://code.xster.net/pygeocoder/wiki/Home
license=('BSD')
depends=(python2-requests)
makedepends=(python2-setuptools)
source=(http://code.xster.net/pygeocoder/downloads/${_pkgname}-${pkgver}.tar.gz)
md5sums=(20d42d0791a1d9287a26973a41eea173)

prepare() {
  sed -i '1s|#!/usr/bin/env python|#!/usr/bin/env python2|' ${srcdir}/${_pkgname}-${pkgver}/pygeocoder.py
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
