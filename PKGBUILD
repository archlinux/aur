# Maintainer: Andy Botting <andy@andybotting.com>

_name=gnocchiclient
pkgname=python-gnocchiclient
pkgver=7.0.8
pkgrel=3
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
sha512sums=('b2202c3c5f250670b53aabcfc774774243fea2d6488a09c048d20d59d3fd2b5b17dadb7068141f4af0d3240ed234c60039fbfc32f0c44e82b58b24a8a9630962')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
