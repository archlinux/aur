# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python2-sortedcontainers
_pkgname=sorted_containers
pkgver=0.9.6
pkgrel=1
pkgdesc='Library providing sorted container types for Python.'
arch=(any)
url=https://github.com/d0c-s4vage/py010parser
license=('custom:Apache2')
depends=(python2)
makedepends=(python2-setuptools)
source=(https://github.com/grantjenks/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=(04b9c905258533a580c235e99c4e282d)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
