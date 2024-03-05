# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-futurist
pkgver=3.0.0
pkgrel=1
pkgdesc='Code from the future, delivered to you in the now.'
arch=(any)
url='https://docs.openstack.org/futurist/'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-six python-monotonic python-prettytable
         python-wheel)
checkdepends=(python-eventlet python-oslotest python-stestr
              python-testrepository python-testscenarios python-testtools)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/futurist/archive/$pkgver.tar.gz")
sha512sums=('b8781788fe329391788a0402fb24cf9c503d28496f2db2605effdce1cd1cbdb39b7f2f77c8312513b2da18ed4c008dad2eec37d1bdeb3658652f5fa6a1d59e84')

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
