# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-gnocchiclient
pkgver=7.0.8
pkgrel=1
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
sha512sums=('a840301898cc6ea5ffaeabedee56b9651baf96ea3af247c1f99d7c79ad99cda5c9c4a566d90f65f6e4f4e5888e324b1c65209d9a14f290d5ab4b76739103d2a0')

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
