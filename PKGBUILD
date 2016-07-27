# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.17.6
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL')
depends=('python' 'python-netifaces' 'python-six')
source=("https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11fa4adb2100a1dc2bd0ce390b060334b3b5d886701edb754f7bf938d82d8118')

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
