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
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('76d379c51399233f5084ea7a75c2a2ebb1e178cf448601ef343b3b415c8ea42c90d3d287895b04b761b6e50e410a51be3ea8e3e65a5ef021f57ef7a27eafd55a')

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
