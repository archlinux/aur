# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-designateclient
pkgver='4.0.0'
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
sha512sums=('1f0b3cc0edadd7de245ceba2e72056927f3d7d91a86d751389cde1702f7950b4eb93b2243292a786aecfa108bb0a032072f39d250c05513eeb937538d0227de8')

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
