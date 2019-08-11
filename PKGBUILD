# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-designateclient
pkgver='2.12.0'
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
sha512sums=('99b202696de5c79649893d5a6ed13a422d781a2d87123f94d2c225f51fae5fa2416efd4a3b254954fca092c6eb28948597cceb56f011a1c216d168ff78b22560')

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
