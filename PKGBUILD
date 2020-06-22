# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver='2.2.0'
pkgrel='2'
pkgdesc='Code from the future, delivered to you in the now.'
arch=('any')
url='https://docs.openstack.org/futurist/'
license=('Apache')
depends=('python-pbr' 'python-six' 'python-monotonic' 'python-prettytable'
         'python-wheel')
checkdepends=('python-eventlet' 'python-oslotest' 'python-stestr'
              'python-testrepository' 'python-testscenarios' 'python-testtools')
source=("https://github.com/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('30c0186684a6f03ea6177978093a153f1c2c828a602fe76b1068dcd3feba93aa9791464f109321a2d2c3f7b32f4f76864493fdd225d2d4f9e81ac6fed3be1b4b')

export PBR_VERSION=$pkgver

build() {
  cd futurist-$pkgver
  python setup.py build
}

check() {
  cd futurist-$pkgver
  stestr run
}

package() {
  cd futurist-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
