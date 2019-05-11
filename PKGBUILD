# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-gnocchiclient
pkgver=7.0.4
pkgrel=2
pkgdesc='Python bindings to the Gnocchi API'
arch=('any')
url='https://gnocchi.xyz/gnocchiclient/'
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-ujson' 'python-keystoneauth1'
         'python-six' 'python-futurist' 'python-iso8601' 'python-monotonic'
         'python-dateutil' 'python-debtcollector')
checkdepends=('python-testtools' 'python-fixtures' 'python-openstackclient'
              'python-pytest' 'python-pytest-xdist')
source=("https://github.com/gnocchixyz/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('46cfe78ecba2f18424814452289de3e0ac40d0e8580f6e303616676aa5f145a8eea6df95aa24ca32cb26fba4adf954045c0c00d9a93f2c8b92bd4feb5ba5401b')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
