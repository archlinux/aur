# Maintainer: Andy Botting <andy@andybotting.com>

_name=gnocchiclient
pkgname=python-gnocchiclient
pkgver=7.2.0
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
sha512sums=('02f63821c7267b851090cb1cae9d1b2b953e921ad4299f563bf242d85b8ee4faf1401197f8d587a0035d0e4c0cf2ebaf6da655c67069b53595bd650a865a25ba')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
