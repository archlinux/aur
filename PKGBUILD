# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-manilaclient
pkgver=4.6.0
pkgrel=1
pkgdesc='Client library for OpenStack Manila API'
arch=('any')
url="http://docs.openstack.org/$pkgname"
license=('Apache')
depends=('python-oslo-config' 'python-oslo-log' 'python-oslo-serialization'
         'python-oslo-utils' 'python-pbr' 'python-prettytable'
         'python-requests' 'python-simplejson' 'python-babel' 'python-six'
         'python-keystoneclient')
checkdepends=('python-ddt' 'python-fixtures' 'python-mock' 'python-stestr'
              'python-tempest' 'python-testtools' 'python-openstackclient')
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('d1240c6ddbc90b0269f9d3b4a57ed8b7b1cb220c9bbde6541d65f6cbb1d0a7c15cc51a6894342a5195f749fcfa5835ce1fcb6b8148ad6a4a9a35eab34f24eb7e')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  stestr run
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
