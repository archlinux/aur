# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-gnocchiclient
pkgver=7.0.7
pkgrel=1
pkgdesc='Python bindings to the Gnocchi API'
arch=('any')
url='https://gnocchi.xyz/gnocchiclient/'
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-ujson' 'python-keystoneauth1'
         'python-six' 'python-futurist' 'python-iso8601' 'python-monotonic'
         'python-dateutil' 'python-debtcollector')
checkdepends=('python-testtools' 'python-fixtures' 'python-openstackclient'
              'python-pytest' 'python-pytest-xdist')
source=("https://github.com/gnocchixyz/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c5177ec2f41cee5043d360aa0a71ecc2eab07d3aae24f8d317e9026adadf39dea37df13140b2c07dd6ee1dd7714aef0eb8e88b82a321a45203dc1b715a7d48ed')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
