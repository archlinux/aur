# Maintainer: xrayfur <lukassup at yahoo dot com>

pkgname=gns3-net-converter
pkgver=1.3.0
pkgrel=1
pkgdesc='GNS3 topology converter (from pypi.org)'
arch=('any')
url='https://github.com/GNS3/gns3-converter'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-configobj'
         'python-cx_freeze'
         )
source=(https://pypi.io/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('2367e43bd61382b21152252e834b836a')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
