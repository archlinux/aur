# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-designateclient
pkgver='3.0.0'
pkgrel='1'
pkgdesc='Python client library for Designate'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-cliff' 'python-debtcollector' 'python-jsonschema'
         'python-osc-lib' 'python-oslo-serialization' 'python-oslo-utils'
         'python-keystoneauth1' 'python-pbr' 'python-requests' 'python-six'
         'python-stevedore')
checkdepends=('python-oslo-config' 'python-oslotest' 'python-requests-mock'
              'python-subunit')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('15e1b74769924a94558329d982754b6f7442110312cbef47cd699942964dccbda7718b40932a0dd7bc67587792030f79ebc45bd22ee0c1e30eb0e651694ead85')

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
