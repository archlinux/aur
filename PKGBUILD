# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver=1.8.1
pkgrel=2
pkgdesc='Code from the future, delivered to you in the now.'
arch=('any')
url='https://docs.openstack.org/futurist/'
license=('Apache')
depends=('python-pbr' 'python-six' 'python-monotonic' 'python-prettytable')
checkdepends=('python-eventlet' 'python-oslotest' 'python-testrepository'
              'python-testscenarios' 'python-testtools')
source=("https://github.com/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('2718593c54d2babba96a9a410f09648d7b32c038af912e3f217143ec0e2f11af6427c739acbf34b114351cb35aee869cf8ebcb7436c148f30ccc264664044cbe')

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
