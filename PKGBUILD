# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-heatclient
pkgver='1.18.0'
pkgrel='1'
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
sha512sums=('b778e034bb80823642758fac167b30cf78a3c78dcc3bb99007c051012052b176a8faf4da26917004c21277b9db42c63dbbb9be4f50b5487fd4d6127e3dc78256')

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
