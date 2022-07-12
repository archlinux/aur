# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver=2.4.1
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
sha512sums=('843dddb5aacde60772be4e92b7c514393ccc51849da8c34ce0bdfa77155bcd4d002a1986143f2ba575ff6eb4f2cae036536da484ed0cc494caaf26b417ebb8e1')

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
