# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver=2.3.0
pkgrel=1
pkgdesc='Code from the future, delivered to you in the now.'
arch=('any')
url='https://docs.openstack.org/futurist/'
license=('Apache')
depends=('python-pbr' 'python-six' 'python-monotonic' 'python-prettytable'
         'python-wheel')
checkdepends=('python-eventlet' 'python-oslotest' 'python-stestr'
              'python-testrepository' 'python-testscenarios' 'python-testtools')
source=("https://github.com/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('79a0e8ec71a27ca6a58ed2e45ada7bfaae9f09fe1d68be624eb31593b4417f4c7ec8569cda13727694aa25250f95077d407a13897cc67bd86042ad64d9726540')

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
