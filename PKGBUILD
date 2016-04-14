# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.17.5
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL')
depends=('python' 'python-netifaces' 'python-six')
source=("https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f23ffae888ccebeb7e151fcbbcb617899d54a99d137e36aca093c6bb4d4056e2')

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
