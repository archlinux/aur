# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=3.4.0
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
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('73c66f08385e138654e888d511209fbc3e64b00a83994565ee49ef0ffd00425f222a3fcdf8048d2fe98e772517eca396e87ee0017ca57ea3fcc5edf861a54c01')

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
