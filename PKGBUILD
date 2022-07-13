# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-blazarclient
pkgver=3.4.0
pkgrel=2
pkgdesc='Client library for the Blazar API'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-prettytable' 'python-babel'
         'python-babel' 'python-oslo-log' 'python-oslo-i18n'
         'python-oslo-utils' 'python-keystoneauth1' 'python-osc-lib')
checkdepends=('python-oslotest' 'python-fixtures' 'python-stestr'
              'python-testtools')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('b328dd76757af74fa2bafb45a0d9711fafdbe58117693247bd799e04d54a7051674cfecc414da720574f6450b51ec861113cdafd9f9baea886af9afeff0ed2b7')

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
