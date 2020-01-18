# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-magnumclient
pkgver='2.16.0'
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
sha512sums=('e9f6d463d0063a9cb1f5fd9d0a9565dae7c80765e7be4a62c64ae39efbf39e26f2d0296249c80d2883c196842c66e1d375c081a0cc2ae561ec9f9e08b252988c')

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
