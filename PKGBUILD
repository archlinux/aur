# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver='1.29.0'
pkgrel='1'
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
sha512sums=('93d2611cb46f978d2de9c900e58a3eb2fb51c92c79f36a289f7246d00b2734c550e44cfe284ef491de95ff193035a841e0ed44886062a90b1cfce8d76f5b53a7')

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
