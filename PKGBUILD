# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-designateclient
pkgver=2.11.0
pkgrel=3
pkgdesc='Python client library for Designate'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-cliff' 'python-debtcollector' 'python-jsonschema'
         'python-osc-lib' 'python-oslo-utils' 'python-keystoneauth1'
         'python-pbr' 'python-requests' 'python-six' 'python-stevedore')
checkdepends=('python-oslo-config' 'python-oslotest' 'python-requests-mock'
              'python-subunit')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('8ddb35695fd4997819ee6c1afbf1099d54591563871a2f9f831c34e357b4607cd3045404616f39b8710a73e2436ffac932a7e04f669054f55d266c7381770a13')

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
