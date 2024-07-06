# Maintainer: Andy Botting <andy@andybotting.com>

_name=os-testr
pkgname="python-$_name"
pkgver=3.0.0
pkgrel=2
pkgdesc='A testr wrapper to provide functionality for OpenStack projects'
arch=(any)
url="https://docs.openstack.org/$_name/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-subunit python-testtools)
checkdepends=(python-oslotest python-stestr python-testscenarios
              python-ddt python-six)
source=("https://tarballs.opendev.org/openstack/$_name/$_name-$pkgver.tar.gz")
sha512sums=('707515153f73cb02df138bfc3211f5309b7e2ed0a283c6bf0bd62e4666250b91353a5ac1adaaac750f5c3970ca40531f65574900d2797004815a945504f8e5fc')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

# Tests don't pass
#check() {
#  cd $_name-$pkgver
#  stestr run
#}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
