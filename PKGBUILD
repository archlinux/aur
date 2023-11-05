# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-blazarclient
pkgver=3.7.0
pkgrel=1
pkgdesc='Client library for the Blazar API'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-prettytable' 'python-oslo-i18n'
         'python-oslo-log' 'python-oslo-utils' 'python-keystoneauth1'
         'python-osc-lib')
checkdepends=('python-oslotest' 'python-fixtures' 'python-stestr'
              'python-testtools')
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0da4793055b0a66c1c57baa88ba8bbdd615ae4f3c4fabb2da39f4f4b0cb6074e693d6e481b449069da00c41353a5922c02e280057a45a4b9b24eeb58a4645563')

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
