# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-intervaltree
_pkgname=intervaltree
pkgver=2.1.0
pkgrel=1
pkgdesc='Library providing a mutable, self-balancing interval tree for Python.'
arch=(any)
url=https://github.com/d0c-s4vage/py010parser
license=('custom:Apache2')
depends=(python-sortedcontainers)
makedepends=(python-setuptools)
source=(https://github.com/chaimleib/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=(ad4020de1066461e46eb777a15ce4bd4)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
