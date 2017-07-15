# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.19.1
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL')
depends=('python' 'python-netifaces' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ca8952a3eb04818dcb566e1344f2f15b5dd6d487770384651cdfae777d5eb848')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # No need for enum-compat on Python 3.4+
  sed -i "s/'enum-compat',//" setup.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
