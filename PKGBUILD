# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-magnumclient
pkgver='2.14.0'
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
sha512sums=('75e197d3899b58969f81f50be3ea705099fbb798e125d71a925ed38811377f4280dc3a88ddaf3c9b3be94c652f9ff8dd2ba4ae20e081335ceee9d139789579e0')

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
