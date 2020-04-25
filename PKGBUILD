# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver='2.1.1'
pkgrel='1'
pkgdesc='Code from the future, delivered to you in the now.'
arch=('any')
url='https://docs.openstack.org/futurist/'
license=('Apache')
depends=('python-pbr' 'python-six' 'python-monotonic' 'python-prettytable'
         'python-wheel')
checkdepends=('python-eventlet' 'python-oslotest' 'python-testrepository'
              'python-testscenarios' 'python-testtools')
source=("https://github.com/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('5bc12a2e7c9657ba09b1ce3f527cec810fc8b1dbc8ebc1eeb73a730d19d1165f8d8325051bdc4a31c58ab79492699302a6749670e5c3f35be7d7fe9ecac73ff2')

export PBR_VERSION=$pkgver

build() {
  cd futurist-$pkgver
  python setup.py build
}

check() {
  cd futurist-$pkgver
  python setup.py test
}

package() {
  cd futurist-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
