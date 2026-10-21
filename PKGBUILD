# Maintainer: Andy Botting <andy@andybotting.com>

# Python package name now is with an underscore
_pname=python_barbicanclient
pkgname=python-barbicanclient
pkgver=7.6.0
pkgrel=1
pkgdesc='Client library for the Barbican Key Management API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-requests python-cliff
         python-keystoneauth1 python-oslo-i18n
         python-oslo-serialization python-oslo-utils)
checkdepends=(python-fixtures python-requests-mock python-stestr
              python-testtools python-oslotest python-oslo-config
              python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('71b07b69aeeb982b305d8979ec80e922265f72db446f87e371d7d89495c937e10604f329b74425bd71242a9c9deec87e5a55a49142d619cbca9946edec1b7132')

export PBR_VERSION=$pkgver

build() {
  cd $_pname-$pkgver
  python setup.py build
}

check() {
  cd $_pname-$pkgver
  #stestr run
}

package() {
  cd $_pname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
