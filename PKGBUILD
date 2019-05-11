# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-heatclient
pkgver=1.17.0
pkgrel=3
pkgdesc='Python client library for Heat'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-babel' 'python-pbr' 'python-cliff' 'python-iso8601'
         'python-osc-lib' 'python-prettytable' 'python-oslo-i18n'
         'python-oslo-serialization' 'python-oslo-utils'
         'python-keystoneauth1' 'python-swiftclient' 'python-yaml'
         'python-requests' 'python-six' 'python-openstackclient')
checkdepends=('python-fixtures' 'python-requests-mock' 'python-mock'
              'python-openstackclient' 'python-stestr' 'python-testrepository'
              'python-testscenarios' 'python-mox3')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('fb16f17e1313d1897291fdb4f72641a5e288283a96d88813421f12546e540ffe3a184cd0ec39f9f5acf9aa2f036dc3449ead0269b916c571ee1ec00c152202f9')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
