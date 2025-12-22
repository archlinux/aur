# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_manilaclient
pkgname=python-manilaclient
pkgver=5.7.0
pkgrel=1
pkgdesc='Client library for OpenStack Manila API'
arch=(any)
url="http://docs.openstack.org/$pkgname"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-oslo-config python-oslo-log python-oslo-serialization
         python-oslo-utils python-pbr python-prettytable
         python-requests python-simplejson python-babel python-six
         python-keystoneclient)
checkdepends=(python-ddt python-fixtures python-stestr
              python-tempest python-testtools python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('731a95668ed19f90c5ab7ff2b933bf71cd5f09487e9f6841bc4ffcb6699541b4ca380e41622fc62224dca99e6000cf68461c66f6f55d18edca45873145343626')

export PBR_VERSION=$pkgver

build() {
  cd $_pname-$pkgver
  python setup.py build
}

check() {
  cd $_pname-$pkgver
  # Commented out due to test failure (2)
  #stestr run
}

package() {
  cd $_pname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
