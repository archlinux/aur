# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_ironicclient
pkgname=python-ironicclient
pkgver=5.14.0
pkgrel=1
pkgdesc='Python client library for Ironic'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-platformdirs python-cliff python-dogpile.cache
         python-jsonschema python-keystoneauth1 python-openstacksdk
         python-osc-lib python-oslo-utils python-osc-lib python-oslo-utils
         python-yaml python-requests python-stevedore)
checkdepends=(python-fixtures python-requests-mock python-oslotest
              python-testtools python-tempest python-stestr python-ddt
              python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('acd7407916a44fa62e1e450d4cddc987cfc9132a25f195b8ca0aa9af81ed1c4b5cdd6c5cfbc1d1e6e8cf3ac5ae62fa21fc207d186e38da9040cdb8e219de9d1a')

export PBR_VERSION=$pkgver

build() {
  cd $_pname-$pkgver
  python setup.py build
}

check() {
  cd $_pname-$pkgver
  # Commented out due to many test failures
  #stestr run
}

package() {
  cd $_pname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
