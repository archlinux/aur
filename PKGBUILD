# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-gnocchiclient
pkgver='7.0.6'
pkgrel='1'
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
sha512sums=('b854c26dae3c716812d62066459171fdb39f51a04aa30998a7429f1e50401b2a04c5454e43049b73e182f44aa8ecaf68e574996415a591167e734e58d0a1e5c2')

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
