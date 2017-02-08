# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.18.0
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL')
depends=('python' 'python-netifaces' 'python-six')
source=("https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fb8ebe33eca842fa3d4ffde95ce97d8f7ee73731cd72a88ffbf94be1caf2ac76')

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
