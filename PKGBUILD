# Maintainer: Andy Botting <andy@andybotting.com>

_name=gnocchiclient
pkgname=python-gnocchiclient
pkgver=7.1.0
pkgrel=1
pkgdesc='Python bindings to the Gnocchi API'
arch=(any)
url='https://github.com/gnocchixyz/python-gnocchiclient'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-ujson python-keystoneauth1
         python-six python-futurist python-iso8601 python-monotonic
         python-dateutil python-debtcollector)
checkdepends=(python-testtools python-fixtures python-openstackclient
              python-pytest python-pytest-xdist)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('389a9cefea17b2341cb26683e3aa45993b4f57a021ebb09ab4d527e683dd61c93c1bad8e5fa522ed07eee4feb9ecd83b078971ff363b9913ff321d63523cd695')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
