# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver='2.0.0'
pkgrel='1'
pkgdesc='OpenStackClient plugin for the Placement service'
arch=('any')
url="http://docs.openstack.org/osc-placement"
license=('Apache')
depends=('python-pbr' 'python-six' 'python-keystoneauth1'
         'python-osc-lib')
checkdepends=('python-oslotest' 'python-openstackclient' 'python-stestr'
              'python-wsgi-intercept')
source=("https://github.com/openstack/osc-placement/archive/$pkgver.tar.gz")
sha512sums=('4a6fbe5c12e1f121a882801514541c37c103dc2b695e1d428bd1640ccef2219769577cb0b2dfd6c9782048c021833c74a802274e76d3dbb46b4e36257e5fe667')

export PBR_VERSION=$pkgver

build() {
  cd osc-placement-$pkgver
  python setup.py build
}

check() {
  cd osc-placement-$pkgver
  stestr run
}

package() {
  cd osc-placement-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
