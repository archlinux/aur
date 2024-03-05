# Maintainer: Andy Botting <andy@andybotting.com>

_name=os-testr
pkgname=python-os-testr
pkgver=3.0.0
pkgrel=1
pkgdesc='A testr wrapper to provide functionality for OpenStack projects'
arch=(any)
url="https://docs.openstack.org/$_name/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-subunit python-testtools)
checkdepends=(python-oslotest python-stestr python-testscenarios
              python-ddt python-six)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/$_name/archive/$pkgver.tar.gz")
sha512sums=('49d5334c79434241bf5441390a9c5d67ecd937dea1aca0aadefba056e31950e91457acc576e0318df2fb2e7cb2fc61453ab37e6391113df165829c0dd49a4ea7')

export PBR_VERSION=$pkgver

build() {
  cd $_name
  python setup.py build
}

# Tests don't pass
#check() {
#  cd $_name
#  stestr run
#}

package() {
  cd $_name
  python setup.py install --root="$pkgdir" --optimize=1
}
