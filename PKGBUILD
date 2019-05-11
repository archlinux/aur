# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=1.27.0
pkgrel=2
pkgdesc='Client library for OpenStack Manila API'
arch=('any')
url="http://docs.openstack.org/$pkgname"
license=('Apache')
depends=('python-oslo-config' 'python-oslo-log' 'python-oslo-serialization'
         'python-oslo-utils' 'python-pbr' 'python-prettytable'
         'python-requests' 'python-simplejson' 'python-babel' 'python-six'
         'python-keystoneclient')
checkdepends=('python-ddt' 'python-fixtures' 'python-mock' 'python-os-testr'
              'python-tempest' 'python-testtools' 'python-openstackclient')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('161e7fd66c5761362d656eb37b0a5b19b5922b5ab92410cb67292a6bdeb39c3fca3cd8170ccefe56b93762c9eba39220610494139494897ab9805264f8090ea3')

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
