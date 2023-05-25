# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=4.4.0
pkgrel=1
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
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1d86b641f247c5afd81f6b022ae18e99b2b5ec39437da63506a5f31e0d64d6765bc572f34f1e10ff49c8700c610527db076591685eca117c05feee8b8b3e4ef6')

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
