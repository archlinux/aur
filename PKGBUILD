# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-heatclient
pkgver='2.1.0'
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
sha512sums=('cfbcd75bbcd208a778f8c31de42a2242e2fa80c856345fba1def85fda1c818fa080b29c0ff91ee896caa0375d6058e405d725af2a51e63e906a0f59f3e492b99')

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
