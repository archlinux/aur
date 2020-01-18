# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver='1.10.0'
pkgrel='1'
pkgdesc='Code from the future, delivered to you in the now.'
arch=('any')
url='https://docs.openstack.org/futurist/'
license=('Apache')
depends=('python-pbr' 'python-six' 'python-monotonic' 'python-prettytable')
checkdepends=('python-eventlet' 'python-oslotest' 'python-testrepository'
              'python-testscenarios' 'python-testtools')
source=("https://github.com/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('ae9eb05b895b48dcd71774594b1a8261ba86bf7ae4b0cb30f70edaa75249fe8179ed7e92bec0cb4f9889edbf6e69299adfa5938b7fe45684ecf290be7fae5bc4')

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
