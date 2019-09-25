# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver='1.9.0'
pkgrel='1'
pkgdesc='Code from the future, delivered to you in the now.'
arch=('any')
url='https://docs.openstack.org/futurist/'
license=('Apache')
depends=('python-pbr' 'python-six' 'python-monotonic' 'python-prettytable')
checkdepends=('python-eventlet' 'python-oslotest' 'python-testrepository'
              'python-testscenarios' 'python-testtools')
source=("https://github.com/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('42d47c59160643a3078bef0fcad8b30a0811483b2f3193bd5d0c418d930ca97499cbca4eaca86fd75827fc48f6777dfd67ab6f464bf57a8ee56c361de0bca81b')

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
