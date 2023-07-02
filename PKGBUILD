# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver=2.4.1
pkgrel=2
pkgdesc='Code from the future, delivered to you in the now.'
arch=('any')
url='https://docs.openstack.org/futurist/'
license=('Apache')
depends=('python-pbr' 'python-six' 'python-monotonic' 'python-prettytable'
         'python-wheel')
checkdepends=('python-eventlet' 'python-oslotest' 'python-stestr'
              'python-testrepository' 'python-testscenarios' 'python-testtools')
source=("https://opendev.org/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('1af2ea994f82a1814b54a779ab42bbbf3f7ef9d5fa8cd723b8c20df3eba038e23e0e29a905ba4364b2332c9bdb997d6ec5331c10cdeacb29d498b2692a7033cd')

export PBR_VERSION=$pkgver

build() {
  cd futurist
  python setup.py build
}

check() {
  cd futurist
  stestr run
}

package() {
  cd futurist
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
