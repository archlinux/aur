# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-ceilometerclient
pkgver=2.9.1
pkgrel=1
pkgdesc='Python client library for Ceilometer'
arch=('any')
url="https://docs.openstack.org/$pkgname/latest/"
license=('Apache')
depends=('python-pbr' 'python-iso8601' 'python-keystoneauth1'
         'python-oslo-i18n' 'python-oslo-serialization' 'python-oslo-utils'
         'python-prettytable' 'python-requests' 'python-six' 'python-stevedore')
checkdepends=('python-mock' 'python-subunit' 'python-tempest'
              'python-testrepository')
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('60db2c0c23404083e760fd5180ac2d2e6cb6e71198a784fff40770700dc0b8922b91ed5ed2f02fae99a4ba8224231059fc01f76d8142e3949357d6fe8c4e72e3')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python setup.py testr
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
