# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-magnumclient
pkgver=2.13.0
pkgrel=1
pkgdesc='Python client library for Magnum'
arch=('any')
url="http://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-babel' 'python-six' 'python-keystoneauth1'
         'python-stevedore' 'python-requests' 'python-oslo-i18n'
         'python-oslo-log' 'python-oslo-serialization' 'python-oslo-utils'
         'python-os-client-config' 'python-osc-lib' 'python-prettytable'
         'python-cryptography' 'python-decorator')
checkdepends=('bandit' 'python-fixtures' 'python-openstackclient'
              'python-oslotest' 'python-osprofiler' 'python-stestr'
              'python-testscenarios' 'python-testtools' 'python-mock')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f1043e8bf92e0e825d715b058db788b1108c078b537af646c71eb4d190d39249bbd486d2cdb97fae870ed8a19c86953c188bd8cd31b089bb767c42385c4e0a59')

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
