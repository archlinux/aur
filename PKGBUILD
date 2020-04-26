# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-magnumclient
pkgver='3.0.0'
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
sha512sums=('d3934de111f4d9e3d2fd44ae20c151feef3e9cd8c6a890845112dcdee5016e6df0a205afc5dc44c550b796059371f310d45a7251f7f1b6e6ac5d227387162ad7')

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
