# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-designateclient
pkgver='3.1.0'
pkgrel='1'
pkgdesc='Python client library for Designate'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-cliff' 'python-debtcollector' 'python-jsonschema'
         'python-osc-lib' 'python-oslo-serialization' 'python-oslo-utils'
         'python-keystoneauth1' 'python-pbr' 'python-requests' 'python-six'
         'python-stevedore')
checkdepends=('python-oslo-config' 'python-oslotest' 'python-requests-mock'
              'python-subunit')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('46f09e13cb632cd32eac171a9a7f3352d4179ce4accd6cd07b0df5e49b4e027a129fff53a78e04825d94a5be5ad60ea4a372440c0eb12a93d2bec96d93ea065d')

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
