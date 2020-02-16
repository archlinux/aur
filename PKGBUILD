# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver='2.0.0'
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
sha512sums=('426d8ff946a9681472741c1065a22239f207987d927f95bcb90b41af746e9512b6ed0f9f7cd4d1bc54db8453fefa3723f5a38e2132620c7dc48dac24ee2a595c')

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
