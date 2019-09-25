# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-magnumclient
pkgver='2.15.0'
pkgrel='1'
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
sha512sums=('4fe448c70e21ff4614b9848aa00a9f7945075ab74334b3dc98f9da42671dc395c11ff6d1407f4eb6f4bbf18a9040bc959e320671b5e8a109e667e94a6033b691')

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
